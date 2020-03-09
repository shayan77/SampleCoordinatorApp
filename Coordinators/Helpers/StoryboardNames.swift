//
//  StoryboardNames.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/9/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit


enum Storyboard {
    case home
    case flight
    case bus
    case bill
    
    var storyboard: UIStoryboard {
        var storyboardName: String!
        switch self {
        case .home:
            storyboardName = "Home"
        case .bus:
            storyboardName = "Bus"
        case .flight:
            storyboardName = "Flight"
        case .bill:
            storyboardName = "Bill"
        }
        return UIStoryboard(name: storyboardName, bundle: Bundle.main)
    }
}
