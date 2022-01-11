//
//  TitledTextField.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct TitledTextField: View {
    @State var title: String? = nil
    @State var placeHolder: String
    @Binding var text: String
    
    var isRequired: Bool = false
    
    @State private var isEditing: Bool = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title ?? "")
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
                
            VStack(alignment: .leading, spacing: 0) {
                HStack {
                    TextField(placeHolder, text: $text, onEditingChanged: { editing in
                            if editing {
                                isEditing = editing
                            } else {
                                isEditing = editing
                            }
                        })
                    }
                    .modifier(OutlinedShadowModifier(isEditing: isEditing))
                
                if isRequired {
                    Text("* This field is required")
                        .foregroundColor(Color.red)
                        .font(.footnote)
                }
                
            }
            
        }
        .foregroundColor(Color.gray)
    }
}

struct TitledTextField_Previews: PreviewProvider {
    static var previews: some View {
        TitledTextField(placeHolder: "Placeholder", text: .constant("Hello"))
    }
}
