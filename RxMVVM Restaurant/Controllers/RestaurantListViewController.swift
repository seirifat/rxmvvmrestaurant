//
//  RestaurantListViewController.swift
//  RxMVVM Restaurant
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RestaurantListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private var viewModel: RestaurantListViewModel!
    
    static func instantiate(viewModel: RestaurantListViewModel) -> RestaurantListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(withIdentifier: "RestaurantListViewController") as! RestaurantListViewController
        controller.viewModel = viewModel
        return controller
    }
    
    static func instantiateNav(viewModel: RestaurantListViewModel) -> UINavigationController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let nav = storyboard.instantiateViewController(withIdentifier: "RestaurantListViewControllerNav") as! UINavigationController
        nav.setViewControllers([RestaurantListViewController.instantiate(viewModel: viewModel)], animated: false)
        return nav
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        
        viewModel.fetchRestaurantViewModels().bind(to: tableView.rx.items(cellIdentifier: "cell")) { index, viewModel, cell in
            cell.textLabel?.text = viewModel.displayText
        }.disposed(by: disposeBag)
        
        let itemSelected = tableView.rx.itemSelected
        let modelSelected = tableView.rx.modelSelected(RestaurantViewModel.self)
        
        Observable.zip(itemSelected, modelSelected).subscribe(onNext: { (indexPath, restaurantViewModel) in
            self.tableView.deselectRow(at: indexPath, animated: true)
            
            let alert = UIAlertController(title: restaurantViewModel.getRestaurantName(), message: restaurantViewModel.getCuisineName(), preferredStyle: .alert)
            self.present(alert, animated: true)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        }).disposed(by: disposeBag)
    }

}
