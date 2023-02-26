//
//  LoginView.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false
    
    var body: some View {
        ZStack {
            Color(hex: "40453D")
                .ignoresSafeArea()

            VStack {
                Image("greenreads-silver-big")
                    .resizable()
                    .frame(width: 265, height: 155)
                    .padding(.top, 15)
                    .padding(.bottom, 5)

                Rectangle()
                    .fill(Color.white)
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 1)
                    .padding(.top, 20)

                Spacer()

                VStack(spacing: 15) {
                    TextFieldComponent(
                        placeholderText: "Email",
                        textContent: $email
                    );

                    TogglablePasswordFieldComponent(
                        placeholderText: "Password",
                        textContent: $password
                    );
                }
                .padding(.top, 30)
                
                Button(action: {
                    // Action to perform when the login button is tapped
                }) {
                    Text("Log in")
                        .foregroundColor(.white)
                    // 686868 - 7A816C
                        //.font(.headline)
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                        .background(Color(hex: "919785")) // #919785 - 7A816C
                        .cornerRadius(15)
                }
                .padding(.top, 30)
                
                Spacer()
                
                HStack {
                    Text("Need an account?")
                        .foregroundColor(.white)
                        .font(.system(size: 20).italic())
                    Text("Sign up!")
                        .foregroundColor(Color(hex: "ABB497"))
                        .font(.system(size: 20).italic())
                }
                .padding(.bottom, 20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
