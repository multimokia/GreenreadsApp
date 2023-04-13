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

                TextFieldComponent(
                    placeholderText: "Search",
                    textContent: $searchquery,
                    validationFunction: nil
                );

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
                    ShelfComponent(
                        selectedBook: .constant(nil),
                        books: [
                            Book(
                                id: 1,
                                title: "The Secret of the Purple Island",
                                author: "Lila Reyes",
                                isbn: nil,
                                publication_date: Date(),
                                cover_image: "https://source.unsplash.com/random",
                                summary: "When the five young friends journey to the remote island, they find more than they ever could have imagined. The secrets they uncover will change their lives forever.",
                                rating: 4.234,
                                created_at: Date(),
                                updated_at: Date(),
                                deleted_at: nil
                            )
                        ]
                    );

                    Text("Read")
                        .padding(.leading, 15)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy));
                    ShelfComponent(
                        selectedBook: .constant(nil),
                        books: [
                            Book(
                                id: 1,
                                title: "The Secret of the Purple Island",
                                author: "Lila Reyes",
                                isbn: nil,
                                publication_date: Date(),
                                cover_image: "https://source.unsplash.com/random",
                                summary: "When the five young friends journey to the remote island, they find more than they ever could have imagined. The secrets they uncover will change their lives forever.",
                                rating: 4.234,
                                created_at: Date(),
                                updated_at: Date(),
                                deleted_at: nil
                            )
                        ]
                    );

                    Text("Favourites")
                        .padding(.leading, 15)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .heavy));
                    ShelfComponent(
                        selectedBook: .constant(nil),
                        books: [
                            Book(
                                id: 1,
                                title: "The Secret of the Purple Island",
                                author: "Lila Reyes",
                                isbn: nil,
                                publication_date: Date(),
                                cover_image: "https://source.unsplash.com/random",
                                summary: "When the five young friends journey to the remote island, they find more than they ever could have imagined. The secrets they uncover will change their lives forever.",
                                rating: 4.234,
                                created_at: Date(),
                                updated_at: Date(),
                                deleted_at: nil
                            )
                        ]
                    );
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
