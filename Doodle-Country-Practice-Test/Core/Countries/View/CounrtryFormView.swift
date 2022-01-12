//
//  CounrtryFormView.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct CounrtryFormView: View {
    @EnvironmentObject private var vm: CountriesViewModel
    
    @State var sectionState: [String: Bool] = [:]
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    if let countries = vm.countries?.country {
                        ForEach(countries, id: \.countryID) { item in
                            if item.countryStatus == "1" {
                                
//                                Collapsible {
//                                    Text("\(item.countryName ?? "")")
//                                } iso: {
//                                    Text("\(item.countryISOCode2 ?? "") \(item.countryPhoneCode ?? "")")
//                                } content: {
//                                    VStack {
//                                        if let format = item.countryAddressFormat {
//                                            if !format.isEmpty {
//                                                InputFormView(countryAddressFormat: format, country: item)
//                                            }
//
//                                        }
//
//                                    }
//                                }
                                
                                Section {
                                    if self.isExpanded(item.countryID ?? "") {
                                        VStack {
                                            if let format = item.countryAddressFormat {
//                                                if !format.isEmpty {
                                                    InputFormView(countryAddressFormat: format, country: item)
//                                                }
                                            }
                                        }
                                    }
                                    
                                    
                                } header: {
                                    
                                    VStack {
                                        HStack {
                                            Text("\(item.countryName ?? "")")
                                                .padding()
                                            Spacer()
                                            
                                            if self.isExpanded(item.countryID ?? "") {
                                                Text("\(item.countryISOCode2 ?? "") \(item.countryPhoneCode ?? "")")
                                            }
                                            
                                            Image(systemName: "chevron.right" )
                                                .padding()
//                                                .rotationEffect(Angle(degrees: collapsed ? 90 : 0))
                                        }
                                        .background(
                                            RoundedRectangle(cornerRadius: 4)
                                                .fill(Color.gray.opacity(0.1))
                                        )
                                    }
                                    .onTapGesture {
                                        withAnimation {
                                            self.sectionState[item.countryID ?? ""] = !self.isExpanded(item.countryID ?? "")
                                        }
                                    }
                                }

                                
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle(Text("Country Form"))
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
    
    func isExpanded(_ section: String) -> Bool {
        sectionState[section] ?? false
    }
}

struct CounrtryFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CounrtryFormView()
        }
        .environmentObject(CountriesViewModel())
    }
}
