//
//  CoffeeDetailsViewModel.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import Foundation
import UIKit

class CoffeeDetailsViewModel: BaseViewModel {
    
    var item: Item?
    
    init(item: Item){
        self.item = item
    }
    
    func getHeaderPhotoUrl() -> String {
        guard let image = item?.gallery?.first?.picture else { return "" }
        return image
    }
    
    func getItemDetails() -> DetailsCellViewModel {
        return DetailsCellViewModel(name: item?.name, type: item?.subtitle, address: item?.address)
    }
    func getSmokingArea() -> Bool {
        return item?.smoking_area == 1
    }
    
    func getDescription() -> String {
        return item?.description ?? ""
    }
    func getGalery() -> GaleryCellModel {
        return GaleryCellModel(image1: item?.gallery?[1].picture, image2: item?.gallery?[2].picture, image3: item?.gallery?[3].picture)
    }
}
