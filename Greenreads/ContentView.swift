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
                        AppMainView().background(.black);
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
