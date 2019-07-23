//
//  PeopleViewController.swift
//  pipedrive
//
//  Created by Ramil on 23/07/2019.
//  Copyright © 2019 Ramil. All rights reserved.
//

import UIKit

class PeopleViewController: UIViewController, UITableViewDataSource {
    
    private var peoples = [String]()
    
    var additional = [String]()
    
    let cellReuseIdentifier = "cell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        peoples = ["p1", "p2", "p3", "p4", "p5"]
        peoples += additional
        // Do any additional setup after loading the view.
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
//        tableView.delegate = self as! UITableViewDelegate
//        tableView.dataSource = self as! UITableViewDataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var tableView: UITableView!
    
//    // Return the number of rows for the table.
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    // Provide a cell object for each row.
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Fetch a cell of the appropriate type.
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//
//        // Configure the cell’s contents.
//        cell.textLabel!.text = "Cell text"
//
//        return cell
//    }
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.peoples.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        // set the text from the data model
        cell.textLabel?.text = self.peoples[indexPath.row]
        
        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    @IBAction func loadPeoplePressed(_ sender: Any) {
        loadPeople()
    }
    
    
    func loadPeople(){
        print("People added")
        peoples.append("NEW p1")
        additional.append("New add p")
        print(peoples)
        print(additional)
    }

}
