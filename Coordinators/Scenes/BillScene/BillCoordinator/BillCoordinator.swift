//
//  BillCoordinator.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit


class BillCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationCoordinator: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationCoordinator = navigationController
    }

    func start() {
        let billVC: BillVC = BillVC.instantiate(storyboard: .bill)
        navigationCoordinator.pushViewController(billVC, animated: true)
    }
}
