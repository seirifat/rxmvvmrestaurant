//
//  ViewController.swift
//  RxMVVM Restaurant
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Splash
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIApplication.setRootView(RestaurantListViewController.instantiateNav(viewModel: RestaurantListViewModel()))
    }

}

