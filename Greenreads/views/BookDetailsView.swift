//
//  BookDetailsView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct BookDetailsViewInternals: View {
    // Argdefs
    @Binding var currentView: AnyView?;
    @Binding var book: Book?;

    // States
    @State private var searchquery: String = "";
    @State var books: [Book] = [];
    @State var shelves: [Shelf] = [];
    @State var dispBooks: [Book] = [];
    @State private var rating: CGFloat = 0;

    var body: some View {
        ZStack {
                VStack(alignment: .leading) {
                    HStack {
                        Button (action: {
                            currentView = AnyView(
                                ShelvesListView(
                                    currentView: $currentView
                                )
                            )
                        }) {
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

                        Button (action: {
                            currentView = AnyView(
                                BookContentView(
                                    currentView: $currentView,
                                    book: $book,
                                    rating: rating
                                )
                            );
                        }) {
                            Image(systemName: "info")
                                .foregroundColor(.white)
                                .font(.system(size: 20, weight: .light))
                                .padding(.horizontal, 15);
                        }
                    }

                    Text(book?.title ?? "")
                        .foregroundColor(.white)
                        .padding(.horizontal, 50)
                        .font(.system(size: 68, weight: .heavy));

                    Text(book?.author ?? "")
                        .foregroundColor(.gray)
                        .padding(.horizontal, 50)
                        .font(.system(size: 32));

//                    Text(["A","AA","AAA", "AAAAAAAA", "a", "-"].joined(separator: " • "))
//                        .foregroundColor(.gray)
//                        .padding(.horizontal, 50)
//                        .font(.system(size: 20));

                    Spacer()

                    Group {
                        VStack {
                            HStack {
                                StarRatingComponent(
                                    rating: $rating,
                                    maxRating: 5,
                                    bookId: book?.id ?? 0
                                )
                                    .padding(.init(top: 0, leading: 15, bottom: 0, trailing: 0));

                                Spacer();

                                Menu {
                                    ForEach(shelves, id: \.id) { shelf in
                                        Button(action: {
                                            Task {
                                                if (book != nil) {
                                                    await addBookToshelf(
                                                        bookId: book!.id!,
                                                        shelfId: shelf.id!
                                                    );
                                                }
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
                                shelfId: nil,
                                books: dispBooks
                            ).frame(alignment: .bottom)
                             .onChange(of: searchquery, perform: { query in
                                if (query == "") {
                                    dispBooks = books;
                                }

                                else {
                                    dispBooks = books.filter {
                                        $0.title.lowercased().contains(query.lowercased())
                                    }
                                }
                             });
                        }
                    }.onAppear {
                        Task {
                            books = await getBooks();
                            dispBooks = books;
                            shelves = await getShelves();

                            if (book == nil) {
                                book = books[0];
                            }

                            rating = CGFloat(book?.rating ?? 0);
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
    @Binding var currentView: AnyView?;
    @State var book: Book?;

    var body: some View {
        ZStack {
            BookDetailsViewInternals(currentView: $currentView, book: $book)
                .background(
                    AsyncImage(url: URL(string: book?.cover_image ?? "https://source.unsplash.com/random"))
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
            currentView: .constant(nil),
            book: nil
        ).background(.black);
    }
}
