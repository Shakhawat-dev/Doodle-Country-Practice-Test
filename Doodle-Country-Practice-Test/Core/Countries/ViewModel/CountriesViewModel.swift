//
//  CountriesViewModel.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 10/1/22.
//

import Foundation
import Combine

class CountriesViewModel: ObservableObject {
    @Published var countries: CountryResponseModel?
    
    private let countriesService = CountryService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        self.addSubcribers()
    }
    
    func addSubcribers() {
        // This updates the market data
        countriesService.$countries
            .sink { [weak self] (returnedCountries) in
                self?.countries = returnedCountries
            }
            .store(in: &cancellables)
    }
}
