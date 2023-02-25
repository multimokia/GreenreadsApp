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
        @State private var isPasswordVisible = false
        @State private var isConfirmPasswordVisible = false
        
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
                    
                    VStack {

                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                            .background(Color(hex: "C4C4C4"))
                            .cornerRadius(20)
                            .foregroundColor(Color(hex: "232323"))
                            .font(.system(size: 20).italic())
                            .padding(.top, 10)
                        
                        TextField("Email", text: $email)
                            .padding()
                            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                            .background(Color(hex: "C4C4C4"))
                            .cornerRadius(20)
                            .foregroundColor(Color(hex: "232323"))
                            .font(.system(size: 20).italic())
                            .padding(.top, 10)
                        
                        ZStack(alignment: .trailing) {
                            if isPasswordVisible {
                                TextField("Password", text: $password)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                                    .background(Color(hex: "C4C4C4"))
                                    .cornerRadius(20)
                                    .foregroundColor(Color(hex: "232323"))
                                    .font(.system(size: 20).italic())
                            } else {
                                SecureField("Password", text: $password)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                                    .background(Color(hex: "C4C4C4"))
                                    .cornerRadius(20)
                                    .foregroundColor(Color(hex: "232323"))
                                    .font(.system(size: 20).italic())
                            }
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(Color(hex: "232323"))
                            }
                            .padding(.trailing, 10)
                        }
                        .padding(.top, 10)
                        
                        ZStack(alignment: .trailing) {
                            if isConfirmPasswordVisible {
                                TextField("Confirm Password", text: $confirmPassword)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                                    .background(Color(hex: "C4C4C4"))
                                    .cornerRadius(20)
                                    .foregroundColor(Color(hex: "232323"))
                                    .font(.system(size: 20).italic())
                            } else {
                                SecureField("Confirm Password", text: $confirmPassword)
                                    .padding()
                                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                                    .background(Color(hex: "C4C4C4"))
                                    .cornerRadius(20)
                                    .foregroundColor(Color(hex: "232323"))
                                    .font(.system(size: 20).italic())
                            }
                            Button(action: {
                                isConfirmPasswordVisible.toggle()
                            }) {
                                Image(systemName: isConfirmPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(Color(hex: "232323"))
                            }
                            .padding(.trailing, 10)
                        }
                        .padding(.top, 15)
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
