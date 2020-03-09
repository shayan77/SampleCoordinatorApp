//
//  FlightDetailVC.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit

class FlightDetailVC: UIViewController {
    
    @IBOutlet var flightDetailLabel: UILabel!
    
    var flightDetail: FlightDetailViewModel!
    weak var flightCoordinator: FlightCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.flightDetailLabel.text = flightDetail.flightDescription
    }

}
