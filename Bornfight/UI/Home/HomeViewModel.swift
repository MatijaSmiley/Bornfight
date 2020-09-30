//
//  HomeViewModel.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation

class HomeViewModel: BaseViewModel {
    
    var moveToDetailsScreen: ((Item) -> Void)?
    var moveToFilterScreen: ((String) -> Void)?
    var onDataFetched: EmptyCallback?
    
    private var venue: Venue?

    func fetchData() {
        APIManager.getVenueData { [weak self] (response) in
            guard let self = self else { return }
            switch response {
            case .success(let data):
                self.venue = data
                self.onDataFetched?()
            case .failure(let error):
                self.onError?(error.error.message)
            }
        }
    }
    
    func getCustomPickTitle(section: Int) -> String {
        return self.venue?.data?.customPicks?[section].title ?? ""
    }
    
    func getSectionData(section: Int) -> CustomPick? {
        return self.venue?.data?.customPicks?[section]
    }
    
    func moveToDetails(section: Int, row: Int){
        guard let item = self.venue?.data?.customPicks?[section].items?[row] else { return }
        self.moveToDetailsScreen?(item)
    }
    func moveToFilters(filter: String){
        self.moveToFilterScreen?(filter)
    }
}
