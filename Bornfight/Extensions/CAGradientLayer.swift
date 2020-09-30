//
//  CAGradientLayer.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import Foundation
import UIKit

extension CAGradientLayer {
    static func configureGradient(color1: UIColor, color2: UIColor, frame: CGRect) -> CAGradientLayer {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            color1.cgColor,
            color2.cgColor
            
        ]
        gradientLayer.locations = [0, 1]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        return gradientLayer
    }
}
