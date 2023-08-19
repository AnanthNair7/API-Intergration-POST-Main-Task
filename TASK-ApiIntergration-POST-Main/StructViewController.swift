//
//  StructViewController.swift
//  TASK-ApiIntergration-POST-Main
//
//  Created by Ananth Nair on 17/08/23.
//

import UIKit

struct Root : Codable {
    
    var status : String?
    var makeList : [String?]
    
}
struct Root1 : Codable {
    var modelList : [String?]
}

struct Root2 : Codable {
    var variantList : [String?]
}
