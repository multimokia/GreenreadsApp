//
//  DropdownComponent.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-25.
//

import SwiftUI

struct DropdownComponent: View {
    let values: [String]
    @Binding var selectedValue: String
    let placeholder: String

    @State private var isExpanded = false

    var body: some View {
        VStack {
            HStack {
                Text(selectedValue == "" ? placeholder : selectedValue)
                    .foregroundColor(Color(hex: "232323"))
                    .font(.system(size: 20).italic())
                    .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                    .padding()
                    .background(Color(hex: "C4C4C4"))
                    .cornerRadius(20)
                    .onTapGesture {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }
                Spacer()
                Image(systemName: isExpanded ? "chevron.up" : "chevron.down")
                    .foregroundColor(Color(hex: "232323"))
                    .padding(.trailing, 20)
            }
            if isExpanded {
                ForEach(values, id: \.self) { value in
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                            selectedValue = value
                        }
                    }) {
                        Text(value)
                            .foregroundColor(Color(hex: "232323"))
                            .frame(width: UIScreen.main.bounds.width / 1.5, height: 50)
                            .padding()
                    }
                }
            }
        }
    }
}

struct DropdownComponent_Previews: PreviewProvider {
    static var previews: some View {
        DropdownComponent(values: ["Option 1", "Option 2", "Option 3"], selectedValue: .constant(""), placeholder: "Select an option")
    }
}
