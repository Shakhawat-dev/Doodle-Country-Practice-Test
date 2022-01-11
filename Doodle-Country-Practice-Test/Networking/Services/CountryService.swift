//
//  CountryService.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 10/1/22.
//

import Foundation
import Combine

class CountryService {
    @Published var countries: CountryResponseModel?
    var countrySubscription: AnyCancellable?
  
    init() {
        getCountries()
    }
    
    private func getCountries() {
        guard let url = URL(string: "https://www.test.api.tribel.com/commonapicon/countryLists/") else { return }
        
        countrySubscription = NetworkManager.download(url: url)
            .decode(type: CountryResponseModel.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkManager.handleCompletion, receiveValue: { [weak self](returnedCountries) in
                self?.countries = returnedCountries
                self?.countrySubscription?.cancel()
            })
    }
}
