//
//  CapsuleBackModifier.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct CapsuleBackModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textCase(.uppercase)
            .padding(20)
            .foregroundColor(Color.white)
            .background(
                Capsule()
                    .foregroundColor(Color.orange)
                    .shadow(color: Color.orange.opacity(0.4), radius: 10, x: 2, y: 10)
            )
    }
}

struct CapsuleBackModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello, World!")
            .modifier(CapsuleBackModifier())
    }
}
