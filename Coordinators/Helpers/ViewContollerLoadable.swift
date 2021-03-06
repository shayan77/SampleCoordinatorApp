//
//  Storyboarded.swift
//  Coordinators
//
//  Created by Mohammad Zakizadeh on 3/7/20.
//  Copyright © 2020 SetarehAvval. All rights reserved.
//

import UIKit


protocol ViewContollerLoadable {
    static func instantiate(storyboard: Storyboard) -> Self
}
extension UIViewController: ViewContollerLoadable {}

extension ViewContollerLoadable where Self: UIViewController {
    static func instantiate(storyboard: Storyboard) -> Self {
        let id = String(describing: Self.self)
        let vcStoryBoard = storyboard.storyboard
        let vc = vcStoryBoard.instantiateViewController(withIdentifier: id) as! Self
        return vc
    }
}

extension UIStoryboard {
    static func loadViewController<T>(name: String = String(describing: T.self), bundle: Bundle? = nil) -> T {
        return UIStoryboard(name: name, bundle: bundle).instantiateInitialViewController() as! T
    }
}
