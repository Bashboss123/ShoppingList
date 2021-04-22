//
//  DetailViewController.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/31.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var quantityLabel: UILabel!
    
  
    @IBOutlet weak var newItemNameTextField: UITextField!
    @IBOutlet weak var detailViewController: UILabel!
    @IBOutlet weak var newQuantityTextField: UITextField!
    var item: Item!


    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(item.quantity, item.name)


        // Do any additional setup after loading the view.
        if let Item = item {
        self.title = item.name
    
            quantityLabel.text = "\(item.name), Quantity: \(item.quantity)"
        }
    }
    
    @IBAction func changeQuantityButton(_ sender: UIButton) {
        if  let newQuantity = newQuantityTextField.text {
            if let newName = newItemNameTextField.text {
            
            quantityLabel.text = "\(newName), quantity: \(newQuantity)"
            newQuantityTextField.text = ""
            newItemNameTextField.text = ""
        if let intQuantity = Int(newQuantity) {
                    item.quantity = intQuantity
                    item.name = newName
}

                }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController
        if newQuantityTextField.text != "" {
      
            let newQuantity = Int(newQuantityTextField.text!)
            item.quantity = newQuantity!
            
            
            
            
            
            
       
}
    
    

}
   
    
    
}
