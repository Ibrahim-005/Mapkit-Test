//
//  ListTVC.swift
//  MapkitTest
//
//  Created by cloud_vfx on 21/07/22.
//

import UIKit

class ListTVC: UITableViewController {
  
    var cityArray = ["Doha","Paris","London","Berlin","Moscow"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func addCityButton(_ sender: UIBarButtonItem) {
        alertCity(title: "Add city", placeHolder: "add city what you want") { city in
            self.cityArray.append(city)
            self.tableView.reloadData()
        }
    }
    
    
    
// MARK: - Table view data source
    
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
        self.performSegue(withIdentifier: "showmap", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _ , _ , completion in
            let editingRow = self.cityArray[indexPath.row]
            
            if let index = self.cityArray.firstIndex(of: editingRow){
                self.cityArray.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showmap"{
            
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            let city = cityArray[indexPath.row]
            
            let dest = segue.destination as! ViewController
            dest.name = city
           
        }
    }
}
