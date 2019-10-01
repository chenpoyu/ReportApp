//
//  FunctionViewController.swift
//  ReportApp
//
//  Created by poyuchen on 2018/7/2.
//  Copyright © 2018年 poyuchen. All rights reserved.
//

import Foundation
import UIKit
import KYDrawerController

class FunctionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // 取得最上方status bar 的高度
    var initY: CGFloat = 0.0
    var drawerYisLogin: CGFloat = 0.0
    var drawerYnotLogin: CGFloat = 0.0
    
    let appDel = UIApplication.shared.delegate as! AppDelegate
    
    // button init
    var drawerList: [DrawerFunctionModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // get the count of elements you are going to display in your tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.drawerList.count
    }
    
    // assign the values in your array variable to a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)) as! DrawerCell
        cell.configure(item: self.drawerList[indexPath.row])
        return cell;
    }
    
    // register when user taps a cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        for cell in tableView.visibleCells as! [DrawerCell] {
            cell.inactivated()
        }
        (tableView.cellForRow(at: indexPath) as! DrawerCell).activated()
        changeFunction(function: self.drawerList[indexPath.row].function)
    }
    
    // set the cell height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 51
    }
    
    func refresh() {
        drawerList.removeAll()
        for function in AppDelegate.drawerFunctionList {
            if function.isUse {
                drawerList.append(function)
            }
        }
        drawerTableView.reloadData()
    }
    
    // register when user taps a cell
    func changeFunction(function: String) {
        
        switch function {
        case "home":
            appDel.drawerController.mainViewController = HomeViewController()
            break
        case "hotspot":
            appDel.drawerController.mainViewController = HotSpotViewController()
            break
        case "rent":
            checkLogin(RentViewController())
            break
        case "wallet":
            checkLogin(WalletViewController())
            break
        case "history":
            checkLogin(HistoryViewController())
            break
        case "vip":
            checkLogin(VipViewController())
            break
        case "event":
            appDel.drawerController.mainViewController = EventViewController()
            break
        case "user":
            checkLogin(UserViewController())
            break
        case "help":
            appDel.drawerController.mainViewController = HelpViewController()
            break
        case "logout":
            logout()
            break
        default:
            appDel.drawerController.mainViewController = HomeViewController()
            
        }
        appDel.drawerController.setDrawerState(.closed, animated: true)
    }
    
    func logout() {
    }
    
    func modifyDrawerY() {
    }
}
