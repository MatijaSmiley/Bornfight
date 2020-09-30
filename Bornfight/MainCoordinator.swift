//
//  MainCoordinator.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.pushViewController(createHomeViewController(), animated: false)
    }
    
    func createHomeViewController() -> UIViewController {
        let vc = HomeViewController.instance()
        let viewModel = HomeViewModel()
        vc.viewModel = viewModel
        
        viewModel.moveToDetailsScreen =  { [weak self] item in
            guard let self = self else { return }
            let vc = CoffeeDetailsViewController.instance()
            let viewModel = CoffeeDetailsViewModel(item: item)
            vc.viewModel = viewModel
            self.navigationController.pushViewController(vc, animated: true)
        }
        
        viewModel.moveToFilterScreen =  { [weak self] filter in
            guard let self = self else { return }
            let vc = FilterViewController.instance()
            let viewModel = FilterViewModel(filter: filter)
            vc.viewModel = viewModel
            self.navigationController.pushViewController(vc, animated: true)
        }
        
        vc.viewModel = viewModel
        return vc
    }
}
