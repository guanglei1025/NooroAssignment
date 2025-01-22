//
//  WeatherViewModel.swift
//  NooroAssignment
//
//  Created by Guanglei Liu on 1/21/25.
//

import Foundation
import Observation

@Observable
class WeatherViewModel {
    var searchKeyword: String = ""
    
    var showSearchResult: Bool {
        return searchKeyword.count > 3
    }
}
