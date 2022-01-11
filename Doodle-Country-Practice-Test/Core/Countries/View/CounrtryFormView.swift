//
//  CounrtryFormView.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct CounrtryFormView: View {
    @EnvironmentObject private var vm: CountriesViewModel
    
    var body: some View {
        ZStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 0) {
                    if let countries = vm.countries?.country {
                        ForEach(countries, id: \.countryID) { item in
                            if item.countryStatus == "1" {
                                
                                Collapsible {
                                    Text("\(item.countryName ?? "")")
                                } iso: {
                                    Text("\(item.countryISOCode2 ?? "") \(item.countryPhoneCode ?? "")")
                                } content: {
                                    VStack {
                                        if let format = item.countryAddressFormat {
                                            if !format.isEmpty {
                                                InputFormView(countryAddressFormat: format, country: item)
                                            }
                                            
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
}

struct CounrtryFormView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CounrtryFormView()
        }
        .environmentObject(CountriesViewModel())
    }
}
