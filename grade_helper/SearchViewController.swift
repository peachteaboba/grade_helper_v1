//
//  SearchViewController.swift
//  grade_helper
//
//  Created by Andy Feng on 2/20/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    // Global Variables ::::::::::::::::::::::::::
    var level:Int?
    let levelArr = ["1", "2", "3", "4", "5", "6", "7"]
    
    
    // Outlets :::::::::::::::::::::::::::::::::::
    @IBOutlet weak var GPATextField: UITextField!
    @IBOutlet weak var gradeLevelPicker: UIPickerView!

    
    // Segue Functions :::::::::::::::::::::::::::
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "findStudents" {
            let vc = segue.destination as! ResultsTableViewController
            
            // Set the data for search params in destination vc
            if let gpa = GPATextField.text {
                vc.gpa = Double(gpa)
            }
            
            if let lvl = level {
                vc.level = lvl
            }
            
            // Note: This might set the values to nil (will take care of it in the ResultsTableViewController)
        }
    }
    
    
    
    
    
    // UI Picker View Protocol Functions :::::::::
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return levelArr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return levelArr[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        level = Int(levelArr[row])
    }

    
    
    // UI Lifecycle ::::::::::::::::::::::::::::::
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

