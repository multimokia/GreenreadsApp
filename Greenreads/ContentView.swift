//
//  ContentView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-05.
//

import SwiftUI

struct ContentView: View {
    @State private var isActive: Bool = true;
    var body: some View {
        Group {
            if self.isActive {
                SplashView();
            }

            else {
                LoginView();
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
