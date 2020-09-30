//
//  HorizontalCollectionViewCell.swift
//  Bornfight
//
//  Created by Matija Sabljak on 27/09/2020.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    
    var viewModel: HorizontalCollectionViewCellViewModel? {
        didSet {
            self.nameLabel.text = viewModel?.name
            self.typeLabel.text = viewModel?.type
            self.hot.isHidden = viewModel?.hotPick ?? true
            ImageHelper.loadImage(imageURL: viewModel?.image, imageView: imageView)
        }
    }

    @IBOutlet weak var hot: HotPickView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var baseView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    func configureCell(){
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 1, height: 1)
        containerView.layer.shadowOpacity = 0.2
        containerView.layer.shadowRadius = 4.0
        
        baseView.frame = containerView.bounds
        baseView.layer.cornerRadius = 6

        baseView.layer.masksToBounds = true
        containerView.addSubview(baseView)
        
        hot.layer.cornerRadius = 6
        hot.clipsToBounds = true
        containerView.addSubview(hot)
    }
}
