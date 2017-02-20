//
//  ResultsTableViewController.swift
//  grade_helper
//
//  Created by Andy Feng on 2/20/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit
import CoreData

class ResultsTableViewController: UITableViewController {
    
    
    // Global Variables :::::::::::::::::::::::
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var studentsArr = [Student]()
    var gpa: Double?
    var level: Int?
    
    
    
    
    // UI Lifecycle :::::::::::::::::::::::::::
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch results from core data
        fetchResults()
        
        
        
    }
    
    
    // Helper Methods :::::::::::::::::::::::::
    // Using the search params given, query core data for matching results
    func fetchResults() {
        
        print(gpa ?? "gpa is nil")
        print(level ?? "level is nil")
        
        // Check if the values given are nil and if so give it default values
        if let g = gpa {
            print(g)
        } else {
            gpa = 1.0
        }
        
        if let l = level {
            print(l)
        } else {
            level = 1
        }
        
        
        
        
        // Create tge fetch request
        let userRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
        
        // Create the Predicates
        let mySweetPredicate = NSPredicate(format: "gpa >= \(gpa!)")
        let myOtherSweetPredicate = NSPredicate(format: "level = \(level!)")
        
        // Add both predicates to the fetch request
        userRequest.predicate = NSCompoundPredicate(type: .and, subpredicates: [mySweetPredicate, myOtherSweetPredicate])
        
        // Query Core Data
        do {
            studentsArr = try context.fetch(userRequest) as! [Student]
            print("Successfully got students from core data")
        } catch {
            print("\(error)")
        }
        
        
        
        
        
        
        
    }
    
    
    // Table View Methods :::::::::::::::::::::::::
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsArr.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell")!

        cell.textLabel?.text = studentsArr[indexPath.row].name
        
        cell.detailTextLabel?.text = String(studentsArr[indexPath.row].gpa)

        return cell
    }
    
    
    
    
    
    
}






