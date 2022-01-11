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
    
    @State var isSecured: Bool = false
    
    @State private var isEditing: Bool = false
    @State private var isHidden: Bool = true
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title ?? "")
                .font(.system(size: 16))
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
                
            
            HStack {
                if isSecured {
                    HStack {
                        if isHidden {
                            SecureField(placeHolder, text: $text)
                                .foregroundColor(Color.black)
                        } else {
                            TextField(placeHolder, text: $text, onEditingChanged: { editing in
                                if editing {
                                    isEditing = editing
                                } else {
                                    isEditing = editing
                                }
                            })
                        }
                        
                        
                        if isSecured {
                            Button {
                                isHidden.toggle()
                            } label: {
                                Image(systemName: isHidden ? "eye.slash.fill" : "eye.fill")
                            }
                        }
                    }
                } else {
                    TextField(placeHolder, text: $text, onEditingChanged: { editing in
                        if editing {
                            isEditing = editing
                        } else {
                            isEditing = editing
                        }
                    })
                }
            }
            .modifier(OutlinedShadowModifier(isEditing: isEditing))
        }
        .foregroundColor(Color.gray)
    }
}

struct TitledTextField_Previews: PreviewProvider {
    static var previews: some View {
        TitledTextField(placeHolder: "Placeholder", text: .constant("Text"))
    }
}
