//
//  ViewController.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var newItemTextField: UITextField!
    var items: [Item] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let item1 = Item(name: "Milk", quantity: 2)
        let item2 = Item(name: "Eggs", quantity: 5)
    
    items = [item1, item2]
        if let x = UserDefaults.standard.object(forKey: "items") {
            
            items = x as! [Item]
        }
        
    }
    func alert(message: String) -> Int {
        let alert = UIAlertController(title: "Oh no we ran into a problem ", message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            
        }
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
        return 0
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
            let newItem = Item(name: newItemName, quantity: 1)
            items.append(newItem)
            tableView.reloadData()
       let userDeafaults =  UserDefaults.standard
            
            
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
    
    
    @IBAction func addAndDelete(_ sender: UITapGestureRecognizer) {
    
    let point = sender.location(in: tableView)
        if point.x > 0 {
        if let indexPath = tableView.indexPathForSelectedRow {
                let item = items[indexPath.row]
                item.quantity += 1
            
                
                }
              
            }
    }
        else if point.x < 0 {
            
    if let indexPath = tableView.indexPathForSelectedRow {
        var item = items[indexPath.row]
        if item.quantity > 0 {
        item.quantity -= 1
        } else {
            alert(message: "Cannot have quantity below 1")
        }
        }
    
    }
    
    
    
    

}
