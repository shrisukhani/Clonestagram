//
//  Storyboard+Utility.swift
//  Clonestagram
//
//  Created by Shridhar Sukhani on 1/30/19.
//  Copyright © 2019 Shridhar Sukhani. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard {
    enum CgType: String {
        case main
        case login
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    
    convenience init(type: CgType, bundle: Bundle? = nil) {
        self.init(name: type.filename, bundle: bundle)
    }
    
    static func initialViewController(for type: CgType) -> UIViewController {
        let storyboard = UIStoryboard(type: type)
        guard let initialViewController = storyboard.instantiateInitialViewController() else {
            fatalError("Could not instantiate initial view controller for \(type.filename).storyboard")
        }
        return initialViewController
    }
}
