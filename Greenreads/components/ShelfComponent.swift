import SwiftUI

struct ShelfComponent: View {
    let bookThumbs: [String];

    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(bookThumbs, id:\.self) { thumbUrl in
                    Button(action: {}) {
                        AsyncImage(
                            url: URL(
                                string: thumbUrl
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
        ShelfComponent(bookThumbs: [
            "https://99designs-blog.imgix.net/blog/wp-content/uploads/2017/02/attachment_80004080-e1488217702832.jpg",
        ])
    }
}
