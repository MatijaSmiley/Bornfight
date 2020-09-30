//
//  GaleryCell.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import UIKit

class GaleryCell: UITableViewCell {
    
    var viewModel : GaleryCellModel! {
        didSet{
            ImageHelper.loadImage(imageURL: self.viewModel.image1, imageView: image1)
            ImageHelper.loadImage(imageURL: self.viewModel.image2, imageView: image2)
            ImageHelper.loadImage(imageURL: self.viewModel.image3, imageView: image3)
        }
    }

    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
