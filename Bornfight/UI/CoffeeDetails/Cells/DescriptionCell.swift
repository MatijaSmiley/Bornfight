//
//  DescriptionCell.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import UIKit

class DescriptionCell: UITableViewCell {
    
    @IBOutlet weak var descText: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.descText.textContainerInset = UIEdgeInsets.zero
        self.descText.textContainer.lineFragmentPadding = 0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
