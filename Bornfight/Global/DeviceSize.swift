//
//  DeviceSize.swift
//  Bornfight
//
//  Created by Matija Sabljak on 27/09/2020.
//

import Foundation
import UIKit

class DeviceSize {
        static var screen = DeviceSize()
    
    var height: CGFloat {
        return UIScreen.main.bounds.size.height
    }
    
    var width: CGFloat {
        return UIScreen.main.bounds.size.width
    }
}
