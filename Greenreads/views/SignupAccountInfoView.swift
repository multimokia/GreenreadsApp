//
//  SignupAccountInfoView.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-24.
//

import SwiftUI

struct SignupAccountInfoView: View {
        @State private var email = ""
        @State private var username = ""
        @State private var password = ""
        @State private var confirmPassword = ""

        var body: some View {
            ZStack {
                Color(hex: "40453D")
                    .ignoresSafeArea()
                
                VStack {
//                    TODO - REPLACE LOGO
                    Image("plain-logo")
                        .resizable()
                        .frame(width: 321, height: 186)
                        .padding(.top, 15)
                        //.padding(.bottom, 5)
                    
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: 1)
                        .padding(.top, 20)
                    
                    // Spacer()
                    
                    VStack(spacing: 15) {
                        TextFieldComponent(
                            placeholderText: "Username",
                            textContent: $username
                        );

                        TextFieldComponent(
                            placeholderText: "Email",
                            textContent: $email
                        );

                        TogglablePasswordFieldComponent(
                            placeholderText: "Password",
                            textContent: $password
                        );

                        TogglablePasswordFieldComponent(
                            placeholderText: "Confirm Password",
                            textContent: $confirmPassword
                        );
                    }
                    .padding(.top, 30)

                    Spacer()

                    HStack {
                        Text("Next")
                            .foregroundColor(Color(hex: "ABB497"))
                            .font(.system(size: 20).italic())
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color(hex: "ABB497"))
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                    .background(Color(hex: "40453D"))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 1)
                    )
//                    .padding(.trailing, 30)
                    .padding(.bottom, 30)
//                    .offset(x: -15, y: 0)
                }
            }
        }
}

struct SignupAccountInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SignupAccountInfoView()
    }
}
