//
//  ViewController.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var quantityTextField: UITextField!
    @IBOutlet weak var newItemTextField: UITextField!
    var items: [Item] = []
    let userDeafaults =  UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let item1 = Item(name: "Test", quantity: 2)
        let item2 = Item(name: "Test", quantity: 5)
        
    
   
      
        if let savedItems = UserDefaults.standard.data(forKey: "persistenceArray"){
            print("Found a stored array")
     if let itemsDecoded = try? JSONDecoder().decode([Item].self, from: savedItems) as? [Item] {
                items = itemsDecoded
                print(itemsDecoded)
                tableView.reloadData()
            } else {
                print("Decoding Failed")
          
                tableView.reloadData()
            }
        }
       
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
            if let itemQuantity = quantityTextField.text{
                if let stringQuantity = Int(itemQuantity) {
        
            
            let newItem = Item(name: newItemName, quantity: stringQuantity)
            items.append(newItem)
            newItemTextField.text = ""
                    quantityTextField.text = ""
            tableView.reloadData()
       
          
            
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "persistenceArray")
                print("Encoded \(newItem.name)")
            } else {
                print("Encoding failed")
            }
                }
        }
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
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "persistenceArray")
                
            } else {
                print("Encoding failed")
                alert(message: "Encoding failed")
            }
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
    func alert(message: String) -> Int {
        let alert = UIAlertController(title: "Oh no we ran into a problem ", message: message, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .default) { (UIAlertAction) in
            
        }
        alert.addAction(okayAction)
        present(alert, animated: true, completion: nil)
        return 0
    }
    
    
   
    }
