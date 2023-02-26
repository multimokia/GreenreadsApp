//
//  GenderDropdownComponent.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-25.
//

import SwiftUI

struct GenderDropdownComponent: View {
    @State private var isExpanded = false
    @Binding var selectedValue: String?
    let dropdownOptions: [String]
    let placeholder: String

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(placeholder)
                .italic()
                .foregroundColor(Color(hex: "C4C4C4"))
                .padding(.leading, 20)
            
            ZStack(alignment: .trailing) {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color(hex: "C4C4C4"), lineWidth: 2)
                
                HStack {
                    Text(selectedValue ?? "")
                        .foregroundColor(selectedValue == nil ? Color(hex: "C4C4C4") : Color(hex: "232323"))
                        .padding(.leading, 20)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 18))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    
                    Button(action: {
                        withAnimation {
                            isExpanded.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color(hex: "C4C4C4"))
                            .opacity(selectedValue != nil ? 1 : 0.4)
                            .rotationEffect(.degrees(isExpanded ? 90 : 0))
                            .padding(.trailing, 20)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                if isExpanded {
                    VStack(spacing: 0) {
                        ForEach(dropdownOptions, id: \.self) { option in
                            Button(action: {
                                selectedValue = option
                                isExpanded.toggle()
                            }, label: {
                                Text(option)
                                    .foregroundColor(Color(hex: "232323"))
                                    .padding(EdgeInsets(top: 10, leading: 20, bottom: 5, trailing: 40))
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                            })
                            .foregroundColor(Color(hex: "232323"))
                            .background(Color.white)
                        }
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                    .transition(.opacity)
                }
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width / 1.5, minHeight: 50)
        .overlay(
            Image(systemName: "chevron.down")
                .foregroundColor(Color(hex: "C4C4C4"))
                .opacity(selectedValue != nil ? 0 : 1)
                .rotationEffect(.degrees(isExpanded ? 90 : 0))
                .offset(x: UIScreen.main.bounds.width / 1.5 - 45, y: 0)
        )
        .animation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0.3))
        .zIndex(isExpanded ? 1 : 0)
    }
}
