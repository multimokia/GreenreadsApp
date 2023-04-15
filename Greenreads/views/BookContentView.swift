//
//  BookContentView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct BookContentViewInternals: View {
    // Argdefs
    @Binding var currentView: AnyView?;
    @Binding var book: Book?;
    @State var rating: CGFloat;
    @State var shelves: [Shelf] = [];

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button (action: {
                    currentView = AnyView(
                        BookDetailsView(
                            currentView: $currentView,
                            book: book
                        )
                    );
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }

                Spacer();

                StarRatingComponent(
                    rating: $rating,
                    maxRating: 5,
                    bookId: 0
                )
                    .padding(.trailing, 15);
            }

            ScrollView {
                Text("\"\(book?.summary ?? "")\"")
                    .foregroundColor(.white)
                    .padding(30)
                    .font(.system(size: 18))
                    .italic();
            }

            Spacer()

            Group {
                VStack {
                    HStack {
                        Spacer()

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
                }
            }.onAppear {
                Task {
                    shelves = await getShelves();
                    rating = CGFloat(book?.rating ?? 0);
                }
            }
        }
    }
}

// Wrapper struct to allow background images to easily be applied
// Via a single BookContentView item
struct BookContentView: View {
    // Argdefs
    @Binding var currentView: AnyView?;
    @Binding var book: Book?;
    let rating: CGFloat;

    var body: some View {
        ZStack {
            BookContentViewInternals(
                currentView: $currentView,
                book: $book,
                rating: rating
            )
                .background(
                    AsyncImage(url: URL(string: book?.cover_image ?? "https://source.unsplash.com/random"))
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                        .colorMultiply(Color(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.3))
                        .blur(radius: 4)
                )
        }
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        BookContentView(
            currentView: .constant(nil),
            book: .constant(
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
            ),
            rating: 4.232
        ).background(.black);
    }
}
