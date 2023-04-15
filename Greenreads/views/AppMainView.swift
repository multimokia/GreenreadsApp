//
//  AppMainView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-04-14.
//

import SwiftUI

struct AppMainView: View {
    @State var currentView: AnyView?;

    var body: some View {
        VStack {
            currentView;
        }
            .onAppear {
                currentView = AnyView(BookDetailsView(currentView: $currentView));
            }
    }
}

struct AppMainView_Previews: PreviewProvider {
    static var previews: some View {
        AppMainView()
    }
}
