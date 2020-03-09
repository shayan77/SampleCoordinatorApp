//
//  FlightCoordinator.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit


class FlightCoordinator: Coordinator {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationCoordinator: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationCoordinator = navigationController
    }

    func start() {
        let flightVC: FlightVC = FlightVC.instantiate(storyboard: .flight)
        flightVC.flightCoordinator = self
        navigationCoordinator.pushViewController(flightVC, animated: true)
    }
    public func showFlightDetail(_ flightDetailVM: FlightDetailViewModel) {
        let flightDetail: FlightDetailVC = FlightDetailVC.instantiate(storyboard: .flight)
        flightDetail.flightCoordinator = self
        flightDetail.flightDetail = flightDetailVM
        navigationCoordinator.pushViewController(flightDetail, animated: true)
    }
}
