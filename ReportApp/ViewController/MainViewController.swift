//
//  MainViewController.swift
//  ReportApp
//
//  Created by poyuchen on 2018/6/28.
//  Copyright © 2018年 poyuchen. All rights reserved.
//

import UIKit

enum Language: String {
    case Chinese = "zh-Hant"
    case English = "en"
    case Japanese = "jp"
    static let allValues = [Chinese, English, Japanese]
    
    func wording() -> String {
        switch self {
        case .Chinese:
            return "中文"
        case .English:
            return "English"
        case .Japanese:
            return "にほんご"
        }
    }
}

class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    @IBOutlet var background: UIView!
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var language: UITextField!
    
    var languagePicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        languagePicker = UIPickerView()
        languagePicker.delegate = self
        languagePicker.dataSource = self
        language.inputView = languagePicker
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        // 加在最基底的 self.view 上
        self.view.addGestureRecognizer(tap)
    }
    
    // 按空白處會隱藏編輯狀態
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: UIButton) {
        let appDel = UIApplication.shared.delegate as! AppDelegate
        appDel.showDrawerPage()
    }
    
    // Sets number of columns in picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // Sets the number of rows in the picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Language.allValues.count
    }
    
    // This function sets the text of the picker view to the content of the "salutations" array
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Language.allValues[row].wording()
    }
    
    // When user selects an option, this function will set the text of the text field to reflect the selected option.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        language.text = Language.allValues[row].wording()
    }
}

