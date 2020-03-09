//
//  Coordinator.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/7/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import Foundation
import UIKit


protocol Coordinator: class {
    var childCoordinators: [Coordinator] {get set}
    var navigationCoordinator: UINavigationController {get set}
    
    func start()
}
