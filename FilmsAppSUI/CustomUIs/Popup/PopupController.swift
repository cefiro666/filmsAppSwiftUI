//
//  PopupController.swift
//  FilmsAppSUI
//
//  Created by Виталий Баник on 16.10.2020.
//  Copyright © 2020 Виталий Баник. All rights reserved.
//

import BottomPopup
import UIKit

// MARK: - PopupViewController
class PopupViewController: BottomPopupViewController {

// MARK: - Properties
    var height: CGFloat?
    var topCornerRadius: CGFloat?
    var presentDuration: Double?
    var dismissDuration: Double?
    var shouldDismissInteractivelty: Bool?
    
// MARK: - Methods
    override var popupHeight: CGFloat { return self.height ?? CGFloat(280.0) }
    override var popupTopCornerRadius: CGFloat { return self.topCornerRadius ?? CGFloat(15.0) }
    override var popupPresentDuration: Double { return self.presentDuration ?? 0.4 }
    override var popupDismissDuration: Double { return self.dismissDuration ?? 0.3 }
    override var popupShouldDismissInteractivelty: Bool { return self.shouldDismissInteractivelty ?? true }
    override var popupDimmingViewAlpha: CGFloat { return 0.5 }
}

