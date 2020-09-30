//
//  HotPickView.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import UIKit

class HotPickView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    private func configure() {
        let nib = Bundle.main.loadNibNamed("HotPickView", owner: nil, options: nil)?[0] as! UIView
        nib.frame = self.bounds
        nib.layer.insertSublayer(CAGradientLayer.configureGradient(color1: UIColor.hot_pick_1, color2: UIColor.hot_pick_2, frame: self.frame), at: 0)
        nib.clipsToBounds = true
        self.addSubview(nib)
    }

}
