//
//  RestaurantListViewModel.swift
//  RxMVVM Restaurant
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import Foundation
import RxSwift

class RestaurantListViewModel {

    let title = "Tempat Makan"
    
    private let restaurantService: RestaurantsServiceProtocol
    
    init(service: RestaurantsServiceProtocol = RestaurantService()) {
        self.restaurantService = service
    }
 
    func fetchRestaurantViewModels() -> Observable<[RestaurantViewModel]> {
        restaurantService.fetchRestaurant().map { $0.map{ RestaurantViewModel(restaurant: $0) } }
        
        /// Long Version
        ///
//        restaurantService.fetchRestaurant().map { (restaurant) -> [RestaurantViewModel] in
//            return restaurant.map { (restaurant) -> RestaurantViewModel in
//                return RestaurantViewModel(restaurant: restaurant)
//            }
//        }
        
    }
}
