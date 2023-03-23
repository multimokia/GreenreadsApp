//
//  RadioButtonComponent.swift
//  Greenreads
//
//  Created by Sarah Sami on 2023-02-25.
//

import SwiftUI

//struct RadioButtonComponent: View {
//    let text: String
//    let isSelected: Bool
//    let selectAction: () -> Void
//
//    var body: some View {
//        Button(action: {
//            selectAction()
//        }) {
//            HStack(spacing: 10) {
//                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
//                    .resizable()
//                    .frame(width: 24, height: 24)
//                    .foregroundColor(isSelected ? Color(hex: "ABB497") : Color(hex: "C4C4C4"))
//
//                Text(text)
//                    .foregroundColor(.white)
//                    .font(.system(size: 16))
//
//                Spacer()
//            }
//            .padding()
//            .frame(width: UIScreen.main.bounds.width / 1.5, height: 30)
//            .background(Color(hex: "40453D"))
//            .cornerRadius(20)
//            .foregroundColor(Color(hex: "232323"))
//            .font(.system(size: 20).italic());
//        }
//    }
//}

//struct RadioButtonComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            RadioButtonComponent(text: "Option 1", isSelected: true) {}
//            RadioButtonComponent(text: "Option 2", isSelected: false) {}
//        }
//        .padding()
//        .background(Color.black)
//    }
//}

struct RadioButtonComponent: View {
    let text: String
    let isSelected: Bool
    let selectAction: () -> Void
    let infoText: String

    @State private var showingInfoPopup = false

    var body: some View {
        HStack {
            Button(action: {
                selectAction()
            }) {
                HStack(spacing: 10) {
                    Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(isSelected ? Color(hex: "ABB497") : Color(hex: "C4C4C4"))

                    Text(text)
                        .foregroundColor(.white)
                        .font(.system(size: 16))

                    Spacer()
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width / 1.6, height: 30)
                .background(Color(hex: "40453D"))
                .cornerRadius(20)
                .foregroundColor(Color(hex: "232323"))
                .font(.system(size: 20).italic())
            }

            Button(action: {
                showingInfoPopup = true
            }) {
                Image(systemName: "info.circle")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            .padding(.trailing, 10)
            .sheet(isPresented: $showingInfoPopup) {
                InfoPopup(text: infoText)
            }
        }
    }
}

struct InfoPopup: View {
    let text: String

    var body: some View {
        VStack {
            Text(text)
                .font(.system(size: 16))
                .foregroundColor(.black)
                .padding()
            Spacer()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding()
    }
}

struct RadioButtonComponent_Previews: PreviewProvider {
    static var previews: some View {
        RadioButtonComponent(text: "I agree to these terms", isSelected: true, selectAction: {}, infoText: "Here is some info about these terms.")
    }
}
