//
//  OutlinedShadowModifier.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct OutlinedShadowModifier: ViewModifier {
    var isEditing: Bool = false
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color.gray.opacity(0.5))
            .padding(20)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                    .shadow(color: Color.gray.opacity(isEditing ? 0.1 : 0.05), radius: 20, x: 0, y: 10)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEditing ? Color.orange : Color.gray.opacity(0.2), lineWidth: 1)
            )
    }
}

struct OutlinedShadowModifier_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
            .modifier(OutlinedShadowModifier())
    }
}
