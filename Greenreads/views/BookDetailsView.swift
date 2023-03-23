//
//  BookDetailsView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct BookDetailsViewInternals: View {
    // Argdefs
    let bookTitle: String;
    let bookAuthor: String;
    let bookTags: [String];
    let rating: CGFloat;

    @State private var searchquery: String = "";

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button (action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }

                TextFieldComponent(
                    placeholderText: "Search",
                    textContent: $searchquery
                );

                Button (action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }
            }

            Text(bookTitle)
                .foregroundColor(.white)
                .padding(.horizontal, 50)
                .font(.system(size: 68, weight: .heavy));

            Text(bookAuthor)
                .foregroundColor(.gray)
                .padding(.horizontal, 50)
                .font(.system(size: 32));

            Text(bookTags.joined(separator: " • "))
                .foregroundColor(.gray)
                .padding(.horizontal, 50)
                .font(.system(size: 20));

            Spacer()

            Group {
                VStack {
                    HStack {
                        StarRatingComponent(rating: rating, maxRating: 5)
                            .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 0));

                        Spacer()
                        Button(action: {}) {
                            Image(systemName: "square.and.arrow.up")
                        }
                            .frame(width: 35, height: 35)
                            .foregroundColor(.white)
                            .background(Color(red: 0.48, green: 0.51, blue: 0.42))
                            .clipShape(Circle());

                        Button(action: {}) {
                            Text("Add to library");
                            Image(systemName: "chevron.right");
                        }
                            .cornerRadius(20)
                            .buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.48, green: 0.51, blue: 0.42))
                            .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 15));
                    }

                    ShelfComponent(bookThumbs: [
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414i/44767458.jpg",
                        "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/02/attachment_80004080-e1488217702832.jpg",
                        "https://images.squarespace-cdn.com/content/v1/563890dce4b0facc12851d8f/1518946695868-3T5CPZ9W9WJURE2AGWPI/ZiSS+Front.jpg",
                        "https://static-cse.canva.com/blob/921497/BlueOrangeandYellowCoolMemoir_InspirationalBookCover.jpg"
                    ]).frame(alignment: .bottom);
                }
            }

        }
    }
}

// Wrapper struct to allow background images to easily be applied
// Via a single BookDetailsView item
struct BookDetailsView: View {
    // Argdefs
    let bookTitle: String;
    let bookAuthor: String;
    let bookTags: [String];
    let backgroundImageUrl: String;
    let rating: CGFloat;

    var body: some View {
        ZStack {
            BookDetailsViewInternals(
                bookTitle: bookTitle,
                bookAuthor: bookAuthor,
                bookTags: bookTags,
                rating: rating
            )
                .background(
                    AsyncImage(url: URL(string: backgroundImageUrl))
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .colorMultiply(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.7))
                        .blur(radius: 4)
                )
        }
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(
            bookTitle: "DUNE",
            bookAuthor: "Frank Herbert",
            bookTags: ["Science Fiction", "Fiction", "Fantasy", "Classics", "Science Fiction Fantasy", "Audiobook", "Space Opera", "Novels", "Adventure", "Adult"],
            backgroundImageUrl: "https://media.discordapp.net/attachments/640994428214837249/1075104620050919444/b.png.png",
            rating: 4.27
        ).background(.black);
    }
}
