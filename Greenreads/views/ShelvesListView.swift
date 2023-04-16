//
//  ShelvesListView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct ShelvesListView: View {
    // Args
    @Binding var currentView: AnyView?;

    // States
    @State var selectedBook: Book? = nil;
    @State private var searchquery: String = "";
    @State private var shelvesWithBooks: [ShelfWithBooks] = [];
    @State private var dispShelves: [ShelfWithBooks] = []

    @State private var newShelfName: String = "";
    @State private var isCreatingNewShelf = false;

    var body: some View {
        VStack {
            HStack {
                Button (action: {
                    currentView = AnyView(BookDetailsView(currentView: $currentView, book: nil));
                }) {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .light))
                        .padding(.horizontal, 15);
                }

                TextFieldComponent(
                    placeholderText: "Search",
                    textContent: $searchquery,
                    validationFunction: nil
                );
            }.padding(.bottom, 15);

            Spacer();

            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(dispShelves, id: \.id) { shelfWithBook in
                        Group {
                            Text(shelfWithBook.name)
                                .padding(.leading, 15)
                                .foregroundColor(.white)
                                .font(.system(size: 16, weight: .heavy));
                            ShelfComponent(
                                selectedBook: $selectedBook,
                                shelfId: shelfWithBook.id,
                                books: shelfWithBook.books ?? []
                            )
                                .frame(minWidth: 150, minHeight: 180)
                        }
                        .contextMenu {
                                Button(action: {
                                    Task {
                                        await deleteShelf(shelfId: shelfWithBook.id);
                                        shelvesWithBooks = await getShelvesWithBooks();

                                        if (searchquery == "") {
                                            dispShelves = shelvesWithBooks;
                                        }

                                        else {
                                            dispShelves = shelvesWithBooks.filter {
                                                $0.name.lowercased().contains(searchquery.lowercased())
                                            }
                                        }
                                    }
                                }) {
                                    Text("Delete shelf")
                                }
                            }
                    };
                };
            }
                .onAppear {
                    Task {
                        shelvesWithBooks = await getShelvesWithBooks();
                        dispShelves = shelvesWithBooks;
                    }
                }
                .onChange(of: searchquery, perform: { query in

                    if (query == "") {
                        dispShelves = shelvesWithBooks;
                    }

                    else {
                        dispShelves = shelvesWithBooks.filter {
                            $0.name.lowercased().contains(query.lowercased())
                        }
                    }
                })

            VStack {
                if (isCreatingNewShelf) {
                    TextFieldComponent(
                        placeholderText: "Enter a shelf name",
                        textContent: $newShelfName,
                        validationFunction: nil
                    )
                        .onSubmit {
                            isCreatingNewShelf = false;
                            Task {
                                await createShelf(name: newShelfName);
                                shelvesWithBooks = await getShelvesWithBooks();

                                if (searchquery == "") {
                                    dispShelves = shelvesWithBooks;
                                }

                                else {
                                    dispShelves = shelvesWithBooks.filter {
                                        $0.name.lowercased().contains(searchquery.lowercased())
                                    }
                                }
                            }
                        }
                }
                HStack {
                    Spacer()

                    Button(action: {
                        isCreatingNewShelf = true;
                    }) {
                        Text("New Shelf");
                    }
                        .cornerRadius(20)
                        .buttonStyle(.borderedProminent)
                        .tint(Color(red: 0.48, green: 0.51, blue: 0.42))
                        .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 15));
                }
            }
        }
            .background(Color(red: 0.25, green: 0.27, blue: 0.24))
            .onChange(of: selectedBook, perform: { book in
                currentView = AnyView(BookDetailsView(currentView: $currentView, book: book));
            });
    }
}

struct ShelvesListView_Previews: PreviewProvider {
    static var previews: some View {
        ShelvesListView(currentView: .constant(nil))
    }
}
