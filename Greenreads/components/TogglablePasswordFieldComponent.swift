//
//  TogglablePasswordFieldComponent.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-25.
//

import SwiftUI

struct TogglablePasswordFieldComponent: View {
    let placeholderText: String;
    @Binding var textContent: String;

    @State var isPasswordVisible: Bool = false;

    var body: some View {
        ZStack(alignment: .trailing) {
            if isPasswordVisible {
                TextFieldComponent(placeholderText: placeholderText, textContent: $textContent)
            }

            else {
                SecureField(placeholderText, text: $textContent)
                    .padding()
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                    .background(Color(hex: "C4C4C4"))
                    .cornerRadius(20)
                    .foregroundColor(Color(hex: "232323"))
                    .font(.system(size: 20).italic());
            }

            Button(action: {
                isPasswordVisible.toggle()
            }) {
                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                    .foregroundColor(Color(hex: "232323"))
            }
            .padding(.trailing, 10)
        }
    }
}
