//
//  AirbnbMainController.swift
//  airbnb-main
//
//  Created by Yonas Stephen on 3/3/17.
//  Copyright © 2017 Yonas Stephen. All rights reserved.
//

import UIKit

class AirbnbMainController: UITabBarController {
    
    let AIRBNB_COLOR = UIColor(r: 255, g: 90, b: 95)
    
    var tabBarHeight: CGFloat = 60
    var tabBarTextAttributesNormal = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor.black]
    var tabBarTextAttributesSelected = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 8), NSAttributedString.Key.foregroundColor: UIColor(r: 255, g: 90, b: 95)]
    
    var tabBarSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    var exploreTabItem: UITabBarItem = {
        let icon =  UIImage(named: "Search")
        let tab = UITabBarItem(title: "EXPLORE", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -5)
        return tab
    }()
    
    lazy var exploreController: AirbnbExploreController = {
        let controller = AirbnbExploreController()
        controller.tabBarItem = self.exploreTabItem
        return controller
    }()
    
    var savedTabItem: UITabBarItem = {
        let icon =  UIImage(named: "Heart")
        let tab = UITabBarItem(title: "SAVED", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -5)
        return tab
    }()
    
    lazy var savedController: UIViewController = {
        let controller = UIViewController()
        controller.tabBarItem = self.savedTabItem
        return controller
    }()
    
    var tripsTabItem: UITabBarItem = {
        let icon =  UIImage(named: "Bed")
        let tab = UITabBarItem(title: "TRIPS", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -5)
        return tab
    }()
    
    lazy var tripsController: AirbnbMapController = {
        let controller = AirbnbMapController()
        controller.tabBarItem = self.tripsTabItem
        return controller
    }()
    
    var inboxTabItem: UITabBarItem = {
        let icon =  UIImage(named: "Message")
        let tab = UITabBarItem(title: "INBOX", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -5)
        return tab
    }()
    
    lazy var inboxController: UIViewController = {
        let controller = UIViewController()
        controller.tabBarItem = self.inboxTabItem
        return controller
    }()
    
    var profileTabItem: UITabBarItem = {
        let icon =  UIImage(named: "Profile")
        let tab = UITabBarItem(title: "PROFILE", image: icon?.tint(with: .black).withRenderingMode(.alwaysOriginal), selectedImage: icon)
        tab.titlePositionAdjustment = UIOffset.init(horizontal: 0, vertical: -5)
        return tab
    }()
    
    lazy var profileController: UIViewController = {
        let controller = UIViewController()
        controller.tabBarItem = self.profileTabItem
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        viewControllers = [exploreController, savedController, tripsController, inboxController, profileController]
        delegate = self
        
        setupTabBar()
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return selectedViewController?.preferredStatusBarUpdateAnimation ?? .fade
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return selectedViewController?.preferredStatusBarStyle ?? .default
    }
    
    override var prefersStatusBarHidden: Bool {
        return selectedViewController?.prefersStatusBarHidden ?? false
    }
    
    func setupTabBar() {
        
        // add separator line
        tabBar.clipsToBounds = true // hide default top border
        tabBar.addSubview(tabBarSeparator)
        
        tabBarSeparator.widthAnchor.constraint(equalTo: tabBar.widthAnchor).isActive = true
        tabBarSeparator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        tabBarSeparator.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor).isActive = true
        tabBarSeparator.topAnchor.constraint(equalTo: tabBar.topAnchor).isActive = true
        
        tabBar.tintColor = AIRBNB_COLOR
        tabBar.barTintColor = UIColor.white
        tabBar.isTranslucent = false
        
        UITabBarItem.appearance().setTitleTextAttributes(tabBarTextAttributesNormal, for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(tabBarTextAttributesSelected, for: .selected)
    }
    
}

extension AirbnbMainController: UITabBarControllerDelegate {
    
}

