//
//  UIWindowExtension.swift
//  RxMVVM Restaurant
//
//  Created by Rifat Firdaus on 23/07/20.
//  Copyright © 2020 Seirifat. All rights reserved.
//

import UIKit

extension UIWindow {
    static var key: UIWindow? {
        if #available(iOS 13, *) {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.keyWindow
        }
    }
}
