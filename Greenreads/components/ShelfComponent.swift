//
//  ShelfComponent.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-02-24.
//

import SwiftUI

struct ShelfComponent: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ForEach(1...5, id:\.self) { i in
                    Button(action: {}) {
                        Text("AAA")
                            .frame(width: 120, height: 180);
                    }.background(Color.secondary);
                }
            }
        }
    }
}

struct ShelfComponent_Previews: PreviewProvider {
    static var previews: some View {
        ShelfComponent()
    }
}
