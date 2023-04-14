//
//  ContentView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = true;
    @State private var isLoggedIn: Bool = false;

    var body: some View {
        NavigationView {
            Group {
                if self.isActive {
                    SplashView();
                }

                else {
                    if isLoggedIn {
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

                    else {
                        LoginView(isLoggedIn: $isLoggedIn);
                    }
                }
            }.onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = false;
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
