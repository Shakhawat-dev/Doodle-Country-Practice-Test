//
//  CountryUserInfoModel.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 12/1/22.
//

import Foundation

struct CountryUserInfoModel: Codable {
    let id: String?
    let firstName: String?
    let lastName: String?
    let company: String?
    let address_1: String?
    let address_2: String?
    let city: String?
    let zone: String?
    let postcode: String?
    let country: String?
    let state: String?
}
