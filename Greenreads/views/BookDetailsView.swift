//
//  BookDetailsView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct BookDetailsViewInternals: View {
    // Argdefs
    @Binding var book: Book?;
    @State private var searchquery: String = "";

    @State var books: [Book] = [];
    @State var shelves: [Shelf] = [];


    var body: some View {
        ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        NavigationLink(destination: ShelvesListView()) {
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
                    }

                    Text(book!.title)
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .font(.system(size: 68, weight: .heavy));

                    Text(book!.author)
                        .foregroundColor(.gray)
                        .padding(.horizontal, 50)
                        .font(.system(size: 32));

                    Text(["A","AA","AAA", "AAAAAAAA", "a", "-"].joined(separator: " • "))
                        .foregroundColor(.gray)
                        .padding(.horizontal, 50)
                        .font(.system(size: 20));

                    Spacer()

                    Group {
                        VStack {
                            HStack {
                                StarRatingComponent(rating: CGFloat(book!.rating), maxRating: 5)
                                    .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 0));

                                Spacer()


                                Menu {
                                    ForEach(shelves, id: \.id) { shelf in
                                        Button(action: {
                                            Task {
                                                await addBookToshelf(
                                                    bookId: book!.id!,
                                                    shelfId: shelf.id!
                                                );
                                            }
                                        }) {
                                            Text(shelf.name)
                                        }
                                    }
                                } label: {
                                    Text("Add to library");
                                    Image(systemName: "chevron.right");
                                }
                                    .cornerRadius(20)
                                    .buttonStyle(.borderedProminent)
                                    .tint(Color(red: 0.48, green: 0.51, blue: 0.42))
                                    .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 15));
                            }

                            ShelfComponent(
                                selectedBook: $book,
                                books: books
                            ).frame(alignment: .bottom);
                        }
                    }.onAppear {
                        Task {
                            books = await getBooks();
                            shelves = await getShelves()
                        }
                    }
                }
            }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .background(.clear)
    }
}

// Wrapper struct to allow background images to easily be applied
// Via a single BookDetailsView item
struct BookDetailsView: View {
    // Argdefs
    @State var book: Book?;

    var body: some View {
        ZStack {
            BookDetailsViewInternals(book: $book)
                .background(
                    AsyncImage(url: URL(string: book!.cover_image))
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
            book: Book(
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
        ).background(.black);
    }
}
