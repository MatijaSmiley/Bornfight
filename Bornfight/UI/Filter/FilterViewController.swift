//
//  FilterViewController.swift
//  Bornfight
//
//  Created by Matija Sabljak on 29/09/2020.
//

import UIKit

class FilterViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: FilterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupScreen()
    }
    
    func setupScreen(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "FilterTableCellTableViewCell", bundle: .main), forCellReuseIdentifier: "FilterTableCellTableViewCell")
    }

}

extension FilterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 40.0
        default:
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = Bundle.main.loadNibNamed("FilterHeaderView", owner: self, options: nil)?.first as! FilterHeaderView
        sectionView.filtersLabel.text = viewModel.getFilterLabel()
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 100.0
        default:
            return 58.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FilterTableCellTableViewCell", for: indexPath) as? FilterTableCellTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
