//
//  TogglablePasswordFieldComponent.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-25.
//

import SwiftUI

struct TextFieldComponent: View {
    let placeholderText: String;
    @Binding var textContent: String;

    var body: some View {
        TextField(placeholderText, text: $textContent)
            .padding()
            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
            .background(Color(hex: "C4C4C4"))
            .cornerRadius(20)
            .foregroundColor(Color(hex: "232323"))
            .font(.system(size: 20).italic());
    }
}
