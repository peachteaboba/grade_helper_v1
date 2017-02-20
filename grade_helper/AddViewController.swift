//
//  AddViewController.swift
//  grade_helper
//
//  Created by Andy Feng on 2/20/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit
import CoreData

class AddViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    // Global Variables ::::::::::::::::::::::::
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var level:Int?
    let levelArr = ["1", "2", "3", "4", "5", "6", "7"]
    
    
    
    // Outlets :::::::::::::::::::::::::::::::::
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var gpaField: UITextField!
    
    
    
    // Actions :::::::::::::::::::::::::::::::::
    @IBAction func handleCancelButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func handleSaveButtonPressed(_ sender: UIButton) {
        
        // Initialize default values
        var nameSave = "Andy"
        var GPASave = 0.0
        var levelSave = 1
        
        if let name = nameField.text {
            if name != "" {
                nameSave = name
            }
        }
        
        if let g = gpaField.text {
            if let gpa = Double(g) {
                GPASave = gpa
            }
        }
        
        if let lvl = level {
            levelSave = lvl
        }
        
        
        print("name: \(nameSave) ---- gpa: \(GPASave) ---- level: \(levelSave)")
        
        
        // Create the NSManagedObject to save
        let student = NSEntityDescription.insertNewObject(forEntityName: "Student", into: context) as! Student
        student.name = nameSave
        student.gpa = GPASave
        student.level = Int16(levelSave)
        
        // Save to core data
        if context.hasChanges {
            do {
                try self.context.save()
                print("Successfully saved a new student to core data")
            } catch {
                print("\(error)")
            }
        }
        
        
        // Dismiss self
        self.dismiss(animated: true, completion: nil)
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
    
    
    // UI Lifecycle ::::::::::::::::::::::::::::
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    
    
    
}
