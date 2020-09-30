//
//  UIColor.swift
//  Bornfight
//
//  Created by Matija Sabljak on 28/09/2020.
//

import Foundation
import UIKit

extension UIColor {
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

    static let navigation_color_1 = UIColor.init(red: 234/255, green: 182/255, blue: 75/255, alpha: 1)
    static let navigation_color_2 = UIColor.init(red: 231/255, green: 158/255, blue: 86/255, alpha: 1)
    static let hot_pick_1 = UIColor.init(red: 229/255, green: 115/255, blue: 54/255, alpha: 1)
    static let hot_pick_2 = UIColor.init(red: 215/255, green: 90/255, blue: 67/255, alpha: 1)
}


