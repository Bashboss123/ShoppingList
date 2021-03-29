//
//  ViewController.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/29.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        var items: [item] = []
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        let item1 = item(name: "Milk")
        let item2 = item(name: "Eggs")
    items = [item1, item2]
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cellid", for: indexPath)
        cell.textLabel?.text = "Hello"
        return cell
    }
        
    }



