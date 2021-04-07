//
//  Item.swift
//  ShoppingList
//
//  Created by Sasha Fujiwara on 2021/03/29.
//

import Foundation
class Item: Codable
{
    var name: String
    var quantity: Int
    init(name: String, quantity: Int)
{
        self.name = name
        self.quantity = quantity
    
}
    enum CodingKeys: String, CodingKey
    {
        case name
        case quantity
        
    
    }

}


