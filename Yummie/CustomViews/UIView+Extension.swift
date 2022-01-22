//
//  UIView+Extension.swift
//  Yummie
//
//  Created by Vitor Trimer on 20/01/22.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set { self.layer.cornerRadius = newValue}
    }
}
