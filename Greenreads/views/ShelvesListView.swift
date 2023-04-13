//
//  ShelvesListView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct ShelvesListView: View {
    @State private var searchquery: String = "";

    var body: some View {
        VStack {
            HStack {
                Button (action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }

                TextFieldComponent(placeholderText: "Search", textContent: $searchquery, validationFunction: nil);

                Button (action: {}) {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }
            }.padding(.bottom, 15);

            Spacer();

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("To Read")
                        .padding(.leading, 15)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy));
                    ShelfComponent(bookThumbs: [
                        "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/02/attachment_80004080-e1488217702832.jpg",
                        "https://static-cse.canva.com/blob/921497/BlueOrangeandYellowCoolMemoir_InspirationalBookCover.jpg"
                    ]);

                    Text("Read")
                        .padding(.leading, 15)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy));
                    ShelfComponent(bookThumbs: [
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414i/44767458.jpg",
                        "https://images.squarespace-cdn.com/content/v1/563890dce4b0facc12851d8f/1518946695868-3T5CPZ9W9WJURE2AGWPI/ZiSS+Front.jpg",
                        "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/contemporary-fiction-night-time-book-cover-design-template-1be47835c3058eb42211574e0c4ed8bf_screen.jpg",
                        "https://images.squarespace-cdn.com/content/v1/563890dce4b0facc12851d8f/1518946622193-O7MD1082UC2NNF9M722O/Lear+Front.jpg"
                    ]);

                    Text("Favourites")
                        .padding(.leading, 15)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy));
                    ShelfComponent(bookThumbs: [
                        "https://images-na.ssl-images-amazon.com/images/S/compressed.photo.goodreads.com/books/1555447414i/44767458.jpg",
                        "https://images.squarespace-cdn.com/content/v1/563890dce4b0facc12851d8f/1518946695868-3T5CPZ9W9WJURE2AGWPI/ZiSS+Front.jpg",
                        "https://images.squarespace-cdn.com/content/v1/563890dce4b0facc12851d8f/1518946622193-O7MD1082UC2NNF9M722O/Lear+Front.jpg"
                    ]);
                }
            }

            VStack {
                HStack {
                    Spacer()

                    Button(action: {}) {
                        Text("New Shelf");
                    }
                        .cornerRadius(20)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.48, green: 0.51, blue: 0.42))
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 15));
                }
            }
        }.background(Color(red: 0.25, green: 0.27, blue: 0.24));
    }
}

struct ShelvesListView_Previews: PreviewProvider {
    static var previews: some View {
        ShelvesListView()
    }
}
