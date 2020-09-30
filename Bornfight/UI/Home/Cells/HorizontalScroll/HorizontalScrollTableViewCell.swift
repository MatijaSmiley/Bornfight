//
//  HorizontalScrollTableViewCell.swift
//  Bornfight
//
//  Created by Matija Sabljak on 27/09/2020.
//

import UIKit

class HorizontalScrollTableViewCell: UITableViewCell {
    
    var moveToDetailsScreen: ((Int) -> Void)?
    var moveToFilterScreen: ((String) -> Void)?
    
    private var itemWidth = CGFloat(DeviceSize.screen.width - 50)
    private var numberOfItems = 0
    
    var sectionData: CustomPick? {
        didSet {
            if let tags = sectionData?.tags {
                setupStackView(tags: tags)
            }
            self.numberOfItems = sectionData?.items?.count ?? 0
            self.collectionView.reloadData()
        }
    }

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollection()
    }
    
    func setupCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "HorizontalCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "HorizontalCollectionViewCell")
    }
    
    func setupStackView(tags: [Tag]){
        for tag in tags {
            let button = UIButton()
            button.backgroundColor = UIColor.hexStringToUIColor(hex: tag.color ?? "ffffff")
            button.layer.cornerRadius = 6
            button.setTitleColor(.white, for: .normal)
            button.setTitle(tag.name, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .medium)
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
        self.moveToFilterScreen?(sender.titleLabel?.text ?? "")
    }
    
    func setupCollectionCellViewModel(index: Int) -> HorizontalCollectionViewCellViewModel {
        let name = sectionData?.items?[index].name
        let image = sectionData?.items?[index].picture_url
        let type = sectionData?.items?[index].subtitle
        let hotPick = sectionData?.items?[index].bat == 0
        let model = HorizontalCollectionViewCellViewModel(hotPick: hotPick, image: image, name: name, type: type)
        return model
    }
    
}

extension HorizontalScrollTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.size.width - 50, height: collectionView.frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        moveToDetailsScreen?(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HorizontalCollectionViewCell", for: indexPath) as! HorizontalCollectionViewCell
        
        cell.viewModel = setupCollectionCellViewModel(index: indexPath.row)
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        targetContentOffset.pointee = scrollView.contentOffset
        var cellToSwipe:Double = Double(Float((scrollView.contentOffset.x))/Float((itemWidth))) + Double(0.5)
        if cellToSwipe < 0 {
            cellToSwipe = 0
        } else if cellToSwipe >= Double(numberOfItems) {
            cellToSwipe = Double(numberOfItems) - Double(1)
        }
        let indexPath:IndexPath = IndexPath(row: Int(cellToSwipe), section:0)
        self.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
}
