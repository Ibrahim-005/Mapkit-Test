//
//  ListTVC.swift
//  MapkitTest
//
//  Created by cloud_vfx on 21/07/22.
//

import UIKit

class ListTVC: UITableViewController {
    
    var cityArray = ["Doha","Paris","London","Berlin","Moscow"]
    var texts : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    
    @IBAction func addCityButton(_ sender: UIBarButtonItem) {
        alertCity(title: "Add city", placeHolder: "add city what you want") { city in
            self.cityArray.append(city)
            self.tableView.reloadData()
            print(city)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let name = cityArray[indexPath.row]
        cell.textLabel?.text = name
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        texts = cityArray[indexPath.row]
        self.performSegue(withIdentifier: "showmap", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showmap"{
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            let dest = segue.destination as! ViewController
            dest.name = texts
            if dest.name == texts {
                
                print("ListTVC __ \(texts)")
            }
        }
    }
}
