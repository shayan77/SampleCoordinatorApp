//
//  HomeVC.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/7/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    
    weak var mainCordintor: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func toFlight(_ sender: Any) {
        mainCordintor?.toFlightScene()
    }
    @IBAction func toBus(_ sender: Any) {
        mainCordintor?.toBusScene()
    }
    @IBAction func toBills(_ sender: Any) {
        mainCordintor?.toBillScene()
    }
    

}

