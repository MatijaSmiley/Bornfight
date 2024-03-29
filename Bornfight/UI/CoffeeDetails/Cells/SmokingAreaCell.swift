//
//  SmokingAreaCell.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import UIKit

class SmokingAreaCell: UITableViewCell {
    
    var smoking: Bool! {
        didSet{
            picture.image = smoking ? UIImage(named: "smoking") : UIImage(named: "nosmoking")
            label.text = smoking ? "Smoking area" : "No smoking area"
        }
    }

    @IBOutlet weak var picture: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
