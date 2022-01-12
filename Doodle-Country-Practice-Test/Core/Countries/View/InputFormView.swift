//
//  InputFormView.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import SwiftUI

struct InputFormView: View {
    @StateObject var vm: InputFormViewModel
    
    var countryAddressFormat: String
    
    init(countryAddressFormat: String, country: Country) {
        _vm = StateObject(wrappedValue: InputFormViewModel(country: country))
        self.countryAddressFormat = countryAddressFormat
    }
    
    var body: some View {
        VStack(spacing: 16) {
            if !countryAddressFormat.isEmpty {
                VStack(spacing: 16) {
                    if countryAddressFormat.contains("firstname") {
                        TitledTextField(title: "First Name", placeHolder: "First Name", text: $vm.firstName)
                    }
                    
                    if countryAddressFormat.contains("lastname") {
                        TitledTextField(title: "Last Name", placeHolder: "Last Name", text: $vm.lastName)
                    }
                    
                    if countryAddressFormat.contains("company") {
                        TitledTextField(title: "Company", placeHolder: "Company", text: $vm.company)
                    }
                    
                    if countryAddressFormat.contains("address_1") {
                        TitledTextField(title: "Address 1", placeHolder: "Address 1", text: $vm.address1)
                    }
                    
                    if countryAddressFormat.contains("address_2") {
                        TitledTextField(title: "Address 2", placeHolder: "Address 2", text: $vm.address2)
                    }
                    
                    if countryAddressFormat.contains("city") {
                        TitledTextField(title: "City", placeHolder: "City", text: $vm.city)
                    }
                    
                    if countryAddressFormat.contains("zone") {
                        TitledTextField(title: "Zone", placeHolder: "Zone", text: $vm.zone)
                    }
                    
                    if countryAddressFormat.contains("postcode") {
                        TitledTextField(title: "Post Code", placeHolder: "Post Code", text: $vm.postCode, isRequired: vm.isPostcodeRequired)
                    }
                    
                    if countryAddressFormat.contains("country") {
                        TitledTextField(title: "Country", placeHolder: "Country", text: $vm.countryName)
                    }
                }
            } else {
                VStack(spacing: 16) {
                    TitledTextField(title: "First Name", placeHolder: "First Name", text: $vm.firstName)
                    TitledTextField(title: "Last Name", placeHolder: "Last Name", text: $vm.lastName)
                    TitledTextField(title: "Company", placeHolder: "Company", text: $vm.company)
                    TitledTextField(title: "Address", placeHolder: "Address", text: $vm.address1)
                    TitledTextField(title: "City", placeHolder: "City", text: $vm.city)
                    TitledTextField(title: "State", placeHolder: "State", text: $vm.countryName)
                }
            }

            Button {
                vm.saveData()
            } label: {
                HStack {
                    Spacer()
                    Text("Save")
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(width: 248)
                .modifier(CapsuleBackModifier())
            }
            .alert(isPresented: $vm.showSuccessAlert) {
                Alert(title: Text("Saved!"), message: Text("Your Data has been saved"), dismissButton: .default(Text("Okay")))
            }
            
        }
        .padding()
        
    }
}

struct InputFormView_Previews: PreviewProvider {
    static var previews: some View {
        InputFormView(countryAddressFormat: "{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}", country: Country(countryID: "", countryName: "", countryISOCode2: "", countryISOCode3: "", countryPhoneCode: "", countryAddressFormat: "", countryPostcodeRequired: "", countryStatus: ""))
            .previewLayout(.sizeThatFits)
    }
}
