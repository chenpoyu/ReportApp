//
//  DrawerViewController.swift
//  ReportApp
//
//  Created by poyuchen on 2018/7/2.
//  Copyright © 2018年 poyuchen. All rights reserved.
//

import Foundation
import UIKit
import KYDrawerController

class DrawerViewController: KYDrawerController {
    
    @IBOutlet weak var funcBtn: UIButton!
    
    let drawerController = KYDrawerController.init(drawerDirection: .left, drawerWidth: 260)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainViewController   = HomeViewController()
        let drawerViewController = HomeViewController()
        
        self.drawerController.mainViewController = mainViewController
        self.drawerController.drawerViewController = drawerViewController
        /*
         
         self.statusBarHeight = Int(UIApplication.shared.statusBarFrame.height)
         self.screenWidth = Int(UIScreen.main.bounds.width)
         self.screenHeight = Int(UIScreen.main.bounds.height)
         self.titleBar = TitleBar()
         
         // Do any additional setup after loading the view.
         self.view.backgroundColor = UIColor.white
         
         titleBar.navigationButton.addTarget(self, action: #selector(didTapOpenButton), for: .touchUpInside)
         titleBar.navigationButton.addTarget(self, action: #selector(dismissKeyboard), for: .touchUpInside)
         */
        
    }
    
    @IBAction func showDrawer(_ sender: Any) {
        drawerController.setDrawerState(.opened, animated: true)
    }
}
