//
//  Collapsible.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct Collapsible<Content: View>: View {
    @State var label: () -> Text
    @State var iso: () -> Text
    @State var content: () -> Content
    
    @State private var collapsed: Bool = false
    
    var body: some View {
        VStack {
            Button  {
                withAnimation {
                    self.collapsed.toggle()
                }
                
            } label: {
                VStack {
                    HStack {
                        self.label()
                            .padding()
                        Spacer()
                        
                        if collapsed {
                            self.iso()
                        }
                        
                        Image(systemName: "chevron.right" )
                            .padding()
                            .rotationEffect(Angle(degrees: collapsed ? 90 : 0))
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 4)
                            .fill(Color.gray.opacity(0.1))
                    )
                }
            }
            .buttonStyle(.plain)

            VStack {
                self.content()
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: collapsed ? .none : 0)
            .clipped()
            .animation(.easeOut)
            .transition(.slide)
        }
    }
}

struct Collapsible_Previews: PreviewProvider {
    static var previews: some View {
        Collapsible(label: {
            Text("Hello")
        }, iso: {
            Text("ISO")
        }, content: {
            VStack {
                Text("All")
            }
        })
    }
}
