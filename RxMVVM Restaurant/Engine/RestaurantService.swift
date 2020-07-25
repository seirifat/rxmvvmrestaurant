//
//  Service.swift
//  RxMVVM Restaurant
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import Foundation
import RxSwift

protocol RestaurantsServiceProtocol {
    func fetchRestaurant() -> Observable<[Restaurant]>
}

class RestaurantService: RestaurantsServiceProtocol {
    
    func fetchRestaurant() -> Observable<[Restaurant]> {
        return Observable.create { (observer) -> Disposable in
            guard let path = Bundle.main.path(forResource: "restaurants", ofType: "json") else {
                observer.onError(NSError(domain: "", code: -1, userInfo: nil))
                return Disposables.create { }
            }
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let restaurants = try JSONDecoder().decode([Restaurant].self, from: data)
                observer.onNext(restaurants)
            } catch {
                observer.onError(error)
            }
            return Disposables.create { }
        }
    }
    
}
