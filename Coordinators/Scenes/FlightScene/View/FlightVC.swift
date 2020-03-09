//
//  FlightVC.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit

class FlightVC: UIViewController {
    
    weak var flightCoordinator: FlightCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func toExplicitFlight(_ sender: Any) {
        let flightVM = FlightDetailViewModel(flightId: 0, flightDescription: "This flight data is passed from parent vc")
        flightCoordinator?.showFlightDetail(flightVM)
    }

}
