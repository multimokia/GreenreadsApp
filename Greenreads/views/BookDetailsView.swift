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

    @State private var searchquery: String = "";

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "ellipsis")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .light))
                    .padding(.horizontal, 15);

                // TODO: Fix the padding of this input field and standardize
                TextField("Search", text: $searchquery)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.gray))
                    .foregroundColor(.white)
                    .padding(.init(top: 20, leading: 0, bottom: 20, trailing: 0))
                    .frame(height: 40);

                Image(systemName: "magnifyingglass")
                    .foregroundColor(.white)
                    .font(.system(size: 20, weight: .light))
                    .padding(.horizontal, 15);
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
            // TODO: Shelf component
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
    
    var body: some View {
        BookDetailsViewInternals(
            bookTitle: bookTitle,
            bookAuthor: bookAuthor,
            bookTags: bookTags
        )
            .background(
                AsyncImage(url: URL(string: backgroundImageUrl))
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
            )
    }
}

struct BookDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailsView(
            bookTitle: "DUNE",
            bookAuthor: "Frank Herbert",
            bookTags: ["Science Fiction", "Fiction", "Fantasy", "Classics", "Science Fiction Fantasy", "Audiobook", "Space Opera", "Novels", "Adventure", "Adult"],
            backgroundImageUrl: "https://media.discordapp.net/attachments/640994428214837249/1075104620050919444/b.png.png"
        );
    }
}
