//
//  CountryResponseModel.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 10/1/22.
//

import Foundation

// MARK: - CountryResponseModel
struct CountryResponseModel: Codable {
    let country: [Country]?
}

// MARK: - Country
struct Country: Codable {
    let countryID, countryName, countryISOCode2, countryISOCode3: String?
    let countryPhoneCode, countryAddressFormat, countryPostcodeRequired, countryStatus: String?

    enum CodingKeys: String, CodingKey {
        case countryID = "country_id"
        case countryName = "country_name"
        case countryISOCode2 = "country_iso_code_2"
        case countryISOCode3 = "country_iso_code_3"
        case countryPhoneCode = "country_phone_code"
        case countryAddressFormat = "country_address_format"
        case countryPostcodeRequired = "country_postcode_required"
        case countryStatus = "country_status"
    }
}
