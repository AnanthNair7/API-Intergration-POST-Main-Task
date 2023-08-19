//
//  SecondViewController.swift
//  TASK-ApiIntergration-POST-Main
//
//  Created by Ananth Nair on 19/08/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var mkLabel: UILabel!
    @IBOutlet weak var vLabel: UILabel!
    @IBOutlet weak var mdLabel: UILabel!
    
    var yearLbl : String?
    var makeLbl : String?
    var madeLbl : String?
    var varientLbl : String?
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        yLabel.text = yearLbl
        mkLabel.text = makeLbl
        mdLabel.text = madeLbl
        vLabel.text = varientLbl
        

    }
    

    
}
