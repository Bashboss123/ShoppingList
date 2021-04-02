//
//  ViewController.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var newItemTextField: UITextField!
    var items: [item] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let item1 = item(name: "Milk", quantity: 2)
        let item2 = item(name: "Eggs", quantity: 5)
    
    items = [item1, item2]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath)
        let currentItem = items[indexPath.row]
        cell.textLabel?.text = currentItem.name
        cell.detailTextLabel?.text = "Quantity: \(currentItem.quantity)"
        return cell
    }
        
    @IBAction func whenAddItemButtonPressed(_ sender: UIBarButtonItem) {
        if let newItemName = newItemTextField.text{
            let newItem = item(name: newItemName, quantity: 1)
            items.append(newItem)
            tableView.reloadData()
            
            
        }
    }
    
    
    
    @IBAction func deleteRow(_ sender: UITapGestureRecognizer) {
    
        let point = sender.location(in: tableView)
        for row in tableView.visibleCells {
            if row.frame.contains(point) {
                tableView.delete(row)
            }
            
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            items.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }
        
    }
    

    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        let point = sender.location(in: tableView)
        for row in tableView.visibleCells {
            if row.frame.contains(point) {
                performSegue(withIdentifier: "Edit", sender: nil)
            }
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let indexPath = tableView.indexPathForSelectedRow {
    let item = items[indexPath.row]
       
    let vc = segue.destination as! DetailViewController
    
    vc.item = item
    }
    }
    
    
}



