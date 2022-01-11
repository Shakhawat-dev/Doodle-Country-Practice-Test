//
//  Doodle_Country_Practice_TestApp.swift
//  Doodle-Country-Practice-Test
//
//  Created by Shakhawat Hossain Shahin on 10/1/22.
//

import SwiftUI

@main
struct Doodle_Country_Practice_TestApp: App {
    @StateObject var vm = CountriesViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CounrtryFormView()
                    .environmentObject(vm)
            }
        }
    }
}
