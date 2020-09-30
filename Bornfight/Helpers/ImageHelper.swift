//
//  ImageHelper.swift
//  Bornfight
//
//  Created by Matija Sabljak on 28/09/2020.
//

import UIKit
import Kingfisher

class ImageHelper{
    
    static func loadImage(imageURL: String?, imageView: UIImageView) {
        guard let imageUrlString = imageURL, let url = URL(string: imageUrlString) else {
            DispatchQueue.main.async {
                imageView.backgroundColor = UIColor.lightGray
            }
            return
        }
        
        ImageCache.default.retrieveImage(forKey: imageUrlString, options: nil) { (image, cacheType) in
            if let image = image {
                DispatchQueue.main.async {
                    imageView.image = image
                    imageView.backgroundColor = .clear
                }
            } else {
                let resource = ImageResource(downloadURL: url, cacheKey: imageUrlString)
                imageView.kf.setImage(with: resource, placeholder: nil)
            }
        }
    }
    
    static func loadImage(imageURL: String?, imageView: UIImageView, onComplete: EmptyCallback) {
        
        guard let imageUrlString = imageURL, let url = URL(string: imageUrlString) else {
            DispatchQueue.main.async {
                imageView.backgroundColor = UIColor.lightGray
            }
            return
        }
        
        ImageCache.default.retrieveImage(forKey: imageUrlString, options: nil) { (image, cacheType) in
            if let image = image {
                DispatchQueue.main.async {
                    imageView.image = image
                }
            } else {
                let resource = ImageResource(downloadURL: url, cacheKey: imageUrlString)
                imageView.kf.setImage(with: resource, placeholder: nil)
            }
        }
        
        onComplete()
    }
}
