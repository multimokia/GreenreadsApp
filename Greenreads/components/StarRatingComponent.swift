//
//  StarRatingComponent.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-24.
//

import SwiftUI

struct StarRatingComponent: View {
    struct ClipShape: Shape {
        let width: Double;

        func path(in rect: CGRect) -> Path {
            Path(CGRect(x: rect.minX, y: rect.minY, width: width, height: rect.height))
        }
    }

    @Binding var rating: CGFloat;
    let maxRating: Int;
    let bookId: Int;
    let ratingColor: Color = .yellow;

    var body: some View {
        HStack {
            HStack(spacing: 0) {
                ForEach(0..<maxRating, id: \.self) { index in
                    Image(systemName: "star")
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.white)
                }
            }.overlay(
                GeometryReader { g in
                    let width = (g.size.width / CGFloat(maxRating)) * CGFloat(rating);
                    HStack(spacing: 0) {
                        ForEach(0..<maxRating, id: \.self) { index in
                            Image(systemName: "star.fill")
                                .foregroundColor(ratingColor)
                                .aspectRatio(contentMode: .fit)
                                .onTapGesture {
                                    print(index + 1);
                                    Task {
                                        let profileBook = await rateBook(bookId: bookId, rating: index + 1);

                                        if (profileBook != nil) {
                                            rating = CGFloat(profileBook?.rating ?? 0);
                                        }
                                    }
                                };
                        }
                    }.clipShape(ClipShape(width: width))
                }
            )
            Text(String(format: "%.2f", rating)).foregroundColor(.yellow);
        }
    }
}

struct StarRatingComponent_Previews: PreviewProvider {
    static var previews: some View {
        StarRatingComponent(rating: .constant(4.33), maxRating: 5, bookId: 0);
    }
}
