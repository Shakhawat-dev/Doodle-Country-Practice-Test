//
//  UserLocalStorage.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 12/1/22.
//

import Foundation

struct UserLocalStorage {
    private static let userDefaults = UserDefaults.standard
    
    private static let dataKey = "countryPersonalData"
    
    static func saveData(dataArray: [CountryUserInfoModel]) {
        let encoder = JSONEncoder()
        
        if let encodedData = try? encoder.encode(dataArray) {
            userDefaults.set(encodedData, forKey: dataKey)
        }
    }
    
    static func getDataArray() -> [CountryUserInfoModel]? {
        var dataArr: [CountryUserInfoModel]? = nil
        
        let decoder = JSONDecoder()
        
        if let userInfoData = userDefaults.value(forKey: dataKey) as? Data {
            if let decodedUserData = try? decoder.decode([CountryUserInfoModel].self, from: userInfoData) {
                dataArr = decodedUserData
            }
        }
        
        return dataArr
    }
}
