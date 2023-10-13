//
//  UIColor_Extension.swift
//  ColorsApp
//
//  Created by param  on 2023-05-17.
//

import UIKit

extension UIColor{
    
    // Added a random color generator in UIColor Class
    // Make it static so that we can directly access this from the class
    static func random() -> UIColor{
        return UIColor(red: CGFloat.random(in: 0...1) , green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
    }
}
