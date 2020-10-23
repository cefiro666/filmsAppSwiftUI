//
//  ActivityView.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 23.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import UIKit

// MARK: - ActivityView
class ActivityView: UIView {
    
// MARK: - Create
    static func create(on controller: UIViewController) -> ActivityView {
        let activityView = ActivityView()
        activityView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityView.frame = controller.view.bounds
        
        let spinnerView = UIActivityIndicatorView()
        spinnerView.style = .large
        spinnerView.startAnimating()
        activityView.addSubview(spinnerView)
        
        spinnerView.center = activityView.center
        
        controller.view.addSubview(activityView)
        return activityView
    }
    
// MARK: - Remove
    func remove() {
        self.removeFromSuperview()
    }
}
 
