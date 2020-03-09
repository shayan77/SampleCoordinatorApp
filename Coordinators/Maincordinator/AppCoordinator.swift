//
//  AppCoordinator.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit



class MainCoordinator: NSObject,Coordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    var childCoordinators = [Coordinator]()
    var navigationCoordinator: UINavigationController

    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationCoordinator = navigationController
        self.window = window
    }

    func start() {
        
        guard let window = window else {return}

        window.rootViewController = navigationCoordinator
        window.makeKeyAndVisible()
        
        let homeVC: HomeVC = HomeVC.instantiate(storyboard: .home)
        homeVC.mainCordintor = self
        
        navigationCoordinator.delegate = self
        navigationCoordinator.pushViewController(homeVC, animated: false)
        
    }
    func toFlightScene() {
        let child = FlightCoordinator(navigationController: navigationCoordinator)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    func toBusScene() {
        let child = BusCoordinator(navigationController: navigationCoordinator)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    func toBillScene(){
        let child = BillCoordinator(navigationController: navigationCoordinator)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
}
extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        // Read the view controller we’re moving from.
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }

        // Check whether our view controller array already contains that view controller. If it does it means we’re pushing a different view controller on top rather than popping it, so exit.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }

        // We’re still here – it means we’re popping the view controller, so we can check whether it’s a flight view controller
        if let flightViewController = fromViewController as? FlightVC {
            // We're popping a flight view controller; end its coordinator
            childDidFinish(flightViewController.flightCoordinator)
        }
        if let busViewController = fromViewController as? BusVC {
            // We're popping a bus view controller; end its coordinator
            childDidFinish(busViewController.busCoordinator)
        }
        if let billViewController = fromViewController as? BillVC {
            // We're popping a bill view controller; end its coordinator
            childDidFinish(billViewController.billCoordinator)
        }
    }
}
