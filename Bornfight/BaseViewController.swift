//
//  BaseViewController.swift
//  Bornfight
//
//  Created by Matija Sabljak on 26/09/2020.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.tintColor = UIColor.white;
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.setGradientBackground(colors: [
            UIColor.navigation_color_1.cgColor,
            UIColor.navigation_color_2.cgColor
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}

extension BaseViewController {
    open class func instance() -> Self {
        if let vc = createFromStoryboard(type: self) {
            return vc
        } else {
            print("WARNING: can't create view controller from storybard:\(self)")
            return self.init()
        }
    }
    
    private class func createFromStoryboard<T: UIViewController>(type: T.Type) -> T? {
        let storyboardName = String(describing: type)
        
        let bundle = Bundle(for: T.self)
        
        guard bundle.path(forResource: storyboardName, ofType: "storyboardc") != nil else {
            return nil
        }
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)
        
        guard let vc = storyboard.instantiateInitialViewController() else {
            print("no vc in storyboard(hint: check initial vc)"); return nil
        }
        
        return vc as? T
    }
}
