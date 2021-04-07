//
//  DetailViewController.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/31.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var quantityLabel: UILabel!
    
    @IBOutlet weak var detailViewController: UILabel!
    @IBOutlet weak var newQuantityTextField: UITextField!
    var item: Item!


    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let Item = item {
        self.title = item.name
        quantityLabel.text = "quantity: \(item.quantity)"
        }
    }
    
    @IBAction func changeQuantityButton(_ sender: UIButton) {
        if newQuantityTextField.text != "" {
        let newQuantity = newQuantityTextField.text
            quantityLabel.text = "quantity: \(newQuantity!)"
            newQuantityTextField.text = ""
        
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nvc = segue.destination as! ViewController
        if newQuantityTextField.text != "" {
        ///    let item =
            let newQuantity = Int(newQuantityTextField.text!)
            item.quantity = newQuantity!
            
            
            
            
            
            
       
}
    
    

}
   
    
    
}
