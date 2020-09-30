//
//  SectionHeaderView.swift
//  Bornfight
//
//  Created by Matija Sabljak on 28/09/2020.
//

import UIKit

class SectionHeaderView: UIView {

    @IBOutlet weak var headerLabel: UILabel!
    
    override func awakeFromNib() {
        headerLabel.textColor = UIColor.black
    }
}
