//
//  SignupUserInfoView.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-24.
//

import SwiftUI

struct SignupUserInfoView: View {
    enum Gender: String, CaseIterable {
        case male = "Male"
        case female = "Female"
        case other = "Other"
    }

    @State private var email = ""
    @State private var username = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var selectedGender = Gender.male;
    let genderOptions = ["Male", "Female", "Other"]

    @State private var isOver18 = false
    @State private var hasAgreed = false

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

                      Picker("Select a gender", selection: $selectedGender) {
                        Text("Male").tag(Gender.male)
                        Text("Female").tag(Gender.female)
                        Text("Other").tag(Gender.other)
                      }
                        .padding()
                        .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                        .background(Color(hex: "C4C4C4"))
                        .cornerRadius(20)
                        .foregroundColor(Color(hex: "232323"))
                        .font(.system(size: 20).italic());

                    RadioButtonComponent(text: "I am over 18 years old", isSelected: isOver18, selectAction: {
                        isOver18.toggle()
                    }, infoText: "This information is needed to tailor your reading experience.")


                    RadioButtonComponent(text: "I agree to these terms", isSelected: hasAgreed, selectAction: {
                        hasAgreed.toggle()
                    }, infoText: "By checking this box, you agree to the terms and conditions outlined in the user agreement.")
                    
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
