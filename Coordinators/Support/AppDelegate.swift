//
//  AppDelegate.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/7/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appCoordinator: MainCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navController = UINavigationController()
        
        appCoordinator = MainCoordinator(navigationController: navController, window: window)
        appCoordinator.start()
        
        return true
    }


}

