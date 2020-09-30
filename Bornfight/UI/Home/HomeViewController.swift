//
//  HomeViewController.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//


import UIKit
import RealmSwift

class HomeViewController: BaseViewController {
    
    var viewModel: HomeViewModel!
    
    private var splash: UIImageView = UIImageView()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTable()
        setupCallbacks()
        setupSplash()
        viewModel.fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "Discovery"
    }
    
    func setupSplash() {
        splash.frame = CGRect(x: 0, y: 0, width: DeviceSize.screen.width, height: DeviceSize.screen.height)
        splash.image = UIImage(named: "splash")
        splash.contentMode = .scaleAspectFill
        splash.clipsToBounds = true
        self.navigationController?.view.addSubview(splash)
    }
    
    func setupTable(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HorizontalScrollTableViewCell", bundle: .main), forCellReuseIdentifier: "HorizontalScrollTableViewCell")
    }
    
    
    func setupCallbacks() {
        viewModel.onDataFetched = { [weak self] in
            guard let self = self else { return }
            self.splash.removeFromSuperview()
            self.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0, 1:
            return 40.0
        default:
            return 0.0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionView = Bundle.main.loadNibNamed("SectionHeaderView", owner: self, options: nil)?.first as! SectionHeaderView
        sectionView.headerLabel.text = viewModel.getCustomPickTitle(section: section)
        return sectionView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0, 1:
            return 350.0
        default:
            return 50.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HorizontalScrollTableViewCell", for: indexPath) as? HorizontalScrollTableViewCell else {
            return UITableViewCell()
        }
        
        cell.sectionData = viewModel.getSectionData(section: indexPath.section)
        
        cell.moveToFilterScreen =  { [weak self] filter in
            guard let self = self else { return }
            self.viewModel.moveToFilters(filter: filter)
        }
        
        cell.moveToDetailsScreen =  { [weak self] index in
            guard let self = self else { return }
            self.viewModel.moveToDetails(section: indexPath.section, row: index)
        }
        
        return cell
    }
}
