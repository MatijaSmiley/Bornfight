//
//  DetailsCell.swift
//  Bornfight
//
//  Created by Matija Sabljak on 28/09/2020.
//

import UIKit

class DetailsCell: UITableViewCell {
    
    var viewModel : DetailsCellViewModel! {
        didSet{
            nameLabel.text = viewModel.name
            typeLabel.text = viewModel.type
            addressLabel.text = viewModel.address
        }
    }

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
