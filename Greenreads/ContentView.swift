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
        Group {
            if self.isActive {
                SplashView();
            }

            else {
                if isLoggedIn {
                    BookDetailsView(
                        bookTitle: "DUNE",
                        bookAuthor: "Frank Herbert",
                        bookTags: ["Science Fiction", "Fiction", "Fantasy", "Classics", "Science Fiction Fantasy", "Audiobook", "Space Opera", "Novels", "Adventure", "Adult"],
                        backgroundImageUrl: "https://media.discordapp.net/attachments/640994428214837249/1075104620050919444/b.png.png",
                        rating: 4.27
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
