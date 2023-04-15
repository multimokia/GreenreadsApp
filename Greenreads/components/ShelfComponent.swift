import SwiftUI

struct ShelfComponent: View {
    @Binding var selectedBook: Book?;
    let shelfId: Int?;
    let books: [Book];

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                if (books.count > 0) {
                    ForEach(books, id:\.self) { book in
                        Button(action: { selectedBook = book }) {
                            AsyncImage(
                                url: URL(
                                    string: book.cover_image
                                )) { image in
                                    image.resizable();
                                } placeholder: {
                                    ProgressView()
                                }.frame(width: 120, height: 180)
                        }
                            .contextMenu {
                                if (shelfId != nil) {
                                    Button(action: {
                                        Task {
                                            await removeBookFromShelf(
                                                bookId: book.id!,
                                                shelfId: shelfId!
                                            );
                                        }
                                    }) {
                                        Text("Remove from shelf")
                                    }
                                }
                            }
                    }
                    .padding(.horizontal, 15)
                }

                else {
                    Text("No items to display.")
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .tint(Color(red: 0.48, green: 0.51, blue: 0.42));
                }
            }
        }
    }
}

struct ShelfComponent_Previews: PreviewProvider {
    static var previews: some View {
        ShelfComponent(
            selectedBook: .constant(nil),
            shelfId: 0,
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
                ),
            ]
        )
    }
}
