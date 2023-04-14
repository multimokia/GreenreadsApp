//
//  ShelvesListView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct ShelvesListView: View {
    @State private var searchquery: String = "";
    @State private var shelvesWithBooks: [ShelfWithBooks] = [];

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
                    ForEach(shelvesWithBooks, id: \.id) { shelfWithBook in
                        Text(shelfWithBook.name)
                            .padding(.leading, 15)
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .heavy));
                        ShelfComponent(
                            selectedBook: .constant(nil),
                            books: shelfWithBook.books
                        );
                    }
                }
                    .onAppear {
                        Task {
                            shelvesWithBooks = await getShelvesWithBooks();
                        }
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
