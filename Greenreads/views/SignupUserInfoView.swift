//
//  SignupUserInfoView.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-24.
//

import SwiftUI

struct SignupUserInfoView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var selectedGender: String?
    let genderOptions = ["Male", "Female", "Other"]

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
                        placeholderText: "First Name",
                        textContent: $username
                    );

                    TextFieldComponent(
                        placeholderText: "Last Name",
                        textContent: $email
                    );

                    GenderDropdownComponent(selectedValue: $selectedGender,
                                                         dropdownOptions: genderOptions,
                                                         placeholder: "Gender")
                    
                    TextFieldComponent(
                        placeholderText: "Last Name",
                        textContent: $email
                    );


                    
                }
                .padding(.top, 30)

                Spacer()

                Button(action: {
                    // Action to perform when the login button is tapped
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                    // 686868 - 7A816C
                        //.font(.headline)
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                        .background(Color(hex: "919785")) // #919785 - 7A816C
                        .cornerRadius(15)
                }
                .padding(.top, 30)
            }
        }
    }
}

struct SignupUserInfoView_Previews: PreviewProvider {
    static var previews: some View {
        SignupUserInfoView()
    }
}
