//
//  SplashView.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-26.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            Color(hex: "40453D")
                .ignoresSafeArea();

            VStack(spacing: 100) {
                Image("greenreads-silver-big")
                    .resizable()
                    .frame(width: 265, height: 155)
                    .padding(.top, 15)
                    .padding(.bottom, 5);

                Text("By Misty D'mello & Sarah Sami")
                    .font(.system(size: 20, weight: .light))
                    .foregroundColor(.white)
                    .italic();
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
