//
//  FilterHeaderView.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import UIKit

class FilterHeaderView: UIView {

    @IBOutlet weak var filtersLabel: UILabel!
    
    override func awakeFromNib() {
        filtersLabel.textColor = UIColor.black
    }
}
