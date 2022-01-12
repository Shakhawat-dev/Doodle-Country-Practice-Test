//
//  InputFormViewModel.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 11/1/22.
//

import Foundation

class InputFormViewModel: ObservableObject {
    @Published var id = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var company = ""
    @Published var address1 = ""
    @Published var address2 = ""
    @Published var city = ""
    @Published var zone = ""
    @Published var postCode = ""
    @Published var countryName = ""
    @Published var state = ""
    
    @Published var showSuccessAlert: Bool = false
    @Published var isPostcodeRequired: Bool = false
    
    @Published var userInfoData: [CountryUserInfoModel] = []
    
    var country: Country?
    
    init(country: Country) {
        self.country = country
        self.getData()
    }
    
    func getData() {
        if let data = UserLocalStorage.getDataArray() {
            self.userInfoData = data
            
            guard let countryUserInfo = data.first(where: {$0.id == country?.countryID ?? ""}) else { return }
            
            self.id = countryUserInfo.id ?? ""
            self.firstName = countryUserInfo.firstName ?? ""
            self.lastName = countryUserInfo.lastName ?? ""
            self.company = countryUserInfo.company ?? ""
            self.address1 = countryUserInfo.address_1 ?? ""
            self.address2 = countryUserInfo.address_2 ?? ""
            self.city = countryUserInfo.city ?? ""
            self.zone = countryUserInfo.zone ?? ""
            self.postCode = countryUserInfo.postcode ?? ""
            self.countryName = countryUserInfo.country ?? ""
            self.state = countryUserInfo.state ?? ""
        }
        
    }
    
    func saveData() {
        
        if let index = self.userInfoData.firstIndex(where: { $0.id == country?.countryID ?? "" })  {
            self.userInfoData.remove(at: index)
            
            if country?.countryPostcodeRequired ?? "0" == "1" {
                if postCode != "" {
                    saveInfo()
                    self.showSuccessAlert = true
                } else {
                    self.isPostcodeRequired = true
                }
                
            } else {
                saveInfo()
                self.showSuccessAlert = true
            }
            
        } else {
            if country?.countryPostcodeRequired ?? "0" == "1" {
                if postCode != "" {
                    saveInfo()
                    self.showSuccessAlert = true
                } else {
                    self.isPostcodeRequired = true
                }
                
            } else {
                saveInfo()
                self.showSuccessAlert = true
            }
        }
        
        UserLocalStorage.saveData(dataArray: userInfoData)
        
        self.getData()
    }
    
    func saveInfo() {

        self.userInfoData.append(CountryUserInfoModel(
            id: country?.countryID ?? "",
            firstName: firstName,
            lastName: lastName,
            company: company,
            address_1: address1,
            address_2: address2,
            city: city,
            zone: zone,
            postcode: postCode,
            country: countryName,
            state: state
        ))

    }
}
