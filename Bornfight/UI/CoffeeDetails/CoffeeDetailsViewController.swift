//
//  CoffeeDetailsViewController.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation
import UIKit

class CoffeeDetailsViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var imageView: UIImageView = UIImageView()
    private var headerCover: UIView = UIView()
    
    var viewModel: CoffeeDetailsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupScreen()
        setupNavigationBarButtons()
    }
    
    func setupScreen(){
        tableView.delegate = self
        tableView.dataSource = self
    
        tableView.register(UINib(nibName: "DetailsCell", bundle: .main), forCellReuseIdentifier: "DetailsCell")
        tableView.register(UINib(nibName: "SmokingAreaCell", bundle: .main), forCellReuseIdentifier: "SmokingAreaCell")
        tableView.register(UINib(nibName: "DescriptionCell", bundle: .main), forCellReuseIdentifier: "DescriptionCell")
        tableView.register(UINib(nibName: "GaleryCell", bundle: .main), forCellReuseIdentifier: "GaleryCell")
        tableView.contentInset = UIEdgeInsets(top: 250, left: 0, bottom: 0, right: 0)
        
        headerCover.frame = CGRect(x: 0, y: 0, width: DeviceSize.screen.width, height: 250)
        headerCover.backgroundColor = UIColor.navigation_color_1
        headerCover.alpha = 0.0

        imageView.frame = CGRect(x: 0, y: 0, width: DeviceSize.screen.width, height: 250)
        imageView.image = UIImage(named: "gostiona")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.addSubview(headerCover)
        
        ImageHelper.loadImage(imageURL: viewModel.getHeaderPhotoUrl(), imageView: imageView)
        view.addSubview(imageView)
    }
    
    func setupNavigationBarButtons() {
        let shareBtn = UIButton(type: UIButton.ButtonType.custom)
        shareBtn.setImage(UIImage(named: "share"), for: [])
        shareBtn.addTarget(self, action: #selector(share), for: UIControl.Event.touchUpInside)
        shareBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let shareBarBtn = UIBarButtonItem(customView: shareBtn)
        
        let favoriteBtn = UIButton(type: UIButton.ButtonType.custom)
        favoriteBtn.setImage(UIImage(named: "favorit"), for: [])
        favoriteBtn.addTarget(self, action: #selector(share), for: UIControl.Event.touchUpInside)
        favoriteBtn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        let favoriteBarBtn = UIBarButtonItem(customView: favoriteBtn)
        
        navigationItem.rightBarButtonItems = [shareBarBtn, favoriteBarBtn]
    }
    
    @objc func share(){
        // TODO
    }
    
    @objc func setFavorite(){
        // TODO
    }
}

extension CoffeeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 150.0
        case 2:
            return 200.0
        case 3:
            return 220.0
        default: 
            return 80.0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsCell", for: indexPath) as? DetailsCell else {
                return UITableViewCell()
            }
            cell.viewModel = viewModel.getItemDetails()
            
            return cell
        
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "SmokingAreaCell", for: indexPath) as? SmokingAreaCell else {
                return UITableViewCell()
            }
            cell.smoking = viewModel.getSmokingArea()
            
            return cell
        case 2:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell else {
                return UITableViewCell()
            }
            cell.descText.attributedText = viewModel.getDescription().htmlToAttributedString
            
            return cell
        case 3:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "GaleryCell", for: indexPath) as? GaleryCell else {
                return UITableViewCell()
            }
            cell.viewModel = viewModel.getGalery()
            
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = 250 - (scrollView.contentOffset.y + 250)
        let height = min(max(y, 0), 350)
        headerCover.alpha = 1 - ((y - 50) / 100)
        imageView.frame = CGRect(x: 0, y: 0, width: DeviceSize.screen.width, height: height)
    }
}
