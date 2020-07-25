//
//  RestaurantViewModel.swift
//  RxMVVM Restaurant
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import UIKit

struct RestaurantViewModel {

    private let restaurant: Restaurant
    
    var displayText: String {
        return restaurant.name + " - " + restaurant.cuisine.rawValue.capitalized
    }
    
    func getRestaurantName() -> String {
        return restaurant.name
    }
    
    
    func getCuisineName() -> String {
        return restaurant.cuisine.rawValue.capitalized
    }
    
    init(restaurant: Restaurant) {
        self.restaurant = restaurant
    }
    
}
