//
//  HabitsViewController.swift
//  Habit By Bit
//
//  Created by Grant Kim on 12/31/17.
//  Copyright © 2017 2.5 Yellow. All rights reserved.
//

import UIKit

class HabitsViewController: UIViewController {

    @IBOutlet weak var habitsTableView: UITableView!
    
    //test
    let testArray = ["1", "2", "3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTableView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//MARK: - table view

extension HabitsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setUpTableView() {
        habitsTableView.delegate = self
        habitsTableView.dataSource = self
        habitsTableView.register(UINib(nibName: "HabitCell", bundle: nil), forCellReuseIdentifier: "habitCell")
        habitsTableView.register(UINib(nibName: "AddCell", bundle: nil), forCellReuseIdentifier: "addCell")
        configureTableView()
    }
    
    func configureTableView() {
        habitsTableView.rowHeight = UITableViewAutomaticDimension
        habitsTableView.estimatedRowHeight = 200.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // change when Core Data model is made
        if indexPath.row == testArray.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "addCell", for: indexPath) as! AddCell
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "habitCell", for: indexPath) as! HabitCell
        cell.testLabel.text = testArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        // placeholder for condition later
        if indexPath.row == 3 {
            performSegue(withIdentifier: "addNewHabit", sender: self)
        }
    }
}
