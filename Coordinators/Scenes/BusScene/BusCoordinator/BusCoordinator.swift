//
//  BusCoordinator.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit


class BusCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationCoordinator: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationCoordinator = navigationController
    }

    func start() {
        let busVC: BusVC = BusVC.instantiate(storyboard: .bus)
        navigationCoordinator.pushViewController(busVC, animated: true)
    }
}
