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

    let rating: Double;
    let maxRating: Int;

    var body: some View {
        HStack {
            HStack(spacing: 0) {
                ForEach(0..<maxRating, id: \.self) { _ in
                    Image(systemName: "star")
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.white);
                }
            }.overlay(
                GeometryReader { g in
                    let width = (g.size.width / CGFloat(maxRating)) * CGFloat(rating);
                    HStack(spacing: 0) {
                        ForEach(0..<maxRating, id: \.self) { _ in
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .aspectRatio(contentMode: .fit);
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
        StarRatingComponent(rating: 4.33, maxRating: 5);
    }
}
