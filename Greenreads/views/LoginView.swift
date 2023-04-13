//
//  LoginView.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-24.
//

import SwiftUI

struct LoginView: View {
    @Binding var isLoggedIn: Bool;
    @State private var email = ""
    @State private var password = ""
    @State private var isPasswordVisible = false

    var body: some View {
        NavigationView {
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
                            textContent: $email,
                            validationFunction: { input in
                                if (input.count > 0) {
                                    return "This field is required.";
                                }

                                return nil;
                            }
                        );

                        TogglablePasswordFieldComponent(
                            placeholderText: "Password",
                            textContent: $password
                        );
                    }
                    .padding(.top, 30)

                    Button(action: {
                        login(
                            email: $email.wrappedValue,
                            password: $password.wrappedValue
                        )
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
                        NavigationLink(destination: SignupAccountInfoView()) {
                            Text("Need an account?")
                                .foregroundColor(.white)
                                .font(.system(size: 20).italic())
                            Text("Sign up!")
                                .foregroundColor(Color(hex: "ABB497"))
                                .font(.system(size: 20).italic())
                        }
                    }
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

extension LoginView {
    func login(email: String, password: String) {
        Task {
            do {
                try await client.auth.signIn(email: email, password: password)
                isLoggedIn = true;
            }

            catch {
                print("Error signing in: \(error)")
            }
        }
    }

    func logout() {
        Task {
            do {
                try await client.auth.signOut()
                isLoggedIn = false;
            }
            catch {
                print("Error signing out: \(error)")
            }
        }
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(isLoggedIn: .constant(false))
    }
}
