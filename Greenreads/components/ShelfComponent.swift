import SwiftUI

struct ShelfComponent: View {
    @Binding var selectedBook: Book?;
    let books: [Book];

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
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
                }
            }.padding(.horizontal, 15)
        }
    }
}

struct ShelfComponent_Previews: PreviewProvider {
    static var previews: some View {
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
                ),
            ]
        )
    }
}
