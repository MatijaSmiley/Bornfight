//
//  FilterViewModel.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import Foundation

class FilterViewModel: BaseViewModel {
    
    var filter: String?
    
    init(filter: String){
        self.filter = filter
    }
  
    func getFilterLabel() -> String {
        return  filter ?? ""
    }
}
