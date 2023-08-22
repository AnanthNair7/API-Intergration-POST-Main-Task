//
//  ViewController.swift
//  TASK-ApiIntergration-POST-Main
//
//  Created by Ananth Nair on 17/08/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var YearLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var makeLabel: UILabel!
    @IBOutlet weak var varientLabel: UILabel!
    
    
    var yearLbl1 : String?
    var makeLbl1: String?
    var madeLbl1: String?
    var varientLbl1 : String?
    
    
    var buttonTapped : Int?
    
    var tbVC : TbViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func yearBtnTapped(_ sender: UIButton) {
        
        buttonTapped = 1
        tableView.isHidden = false
        callNextVC()
        print("YearLabel.text\(YearLabel.text)")
        self.tableView.reloadData()
        
    }
    @IBAction func makeBtnTapped(_ sender: UIButton) {
        buttonTapped = 2
        tableView.isHidden = false
        tbVC?.getMakeResponse()
        callNextVC()
        self.tableView.reloadData()
    }
    @IBAction func modelBtnTapped(_ sender: UIButton) {
        buttonTapped = 3
        tableView.isHidden = false
        tbVC?.getModelResponse()
        callNextVC()
        self.tableView.reloadData()
    }
    @IBAction func varientBtnTapped(_ sender: UIButton) {
        buttonTapped = 4
        tableView.isHidden = false
        tbVC?.getVairentResponse()
        callNextVC()
        self.tableView.reloadData()
    }
    
    @IBAction func doneBtnTapped(_ sender: UIButton) {
        print("DONE BTN TAPPPED ")
        let newVc = self.storyboard?.instantiateViewController(identifier: "second") as! SecondViewController
        newVc.yearLbl = YearLabel.text
        newVc.makeLbl = makeLabel.text
        newVc.madeLbl = modelLabel.text
        newVc.varientLbl = varientLabel.text
        
        self.navigationController?.pushViewController(newVc, animated: true)
    }
    
    func callNextVC(){
        let btnTapped = self.storyboard?.instantiateViewController(withIdentifier:"tb") as! TbViewController
       // if buttonTapped == 1 {
            btnTapped.buttonTapped = buttonTapped
            btnTapped.delegate = self
            btnTapped.yearLbl = YearLabel.text
            btnTapped.madeLbl = modelLabel.text
            btnTapped.makeLbl = makeLabel.text
            print( "btnTapped.buttonTapped\( btnTapped.buttonTapped)")
            print( "btnTapped.makeLbl = makeLabel.text\( btnTapped.makeLbl)")
       
      
       // }
        btnTapped.sheetPresentationController?.detents = [.medium()]
        
        self.present(btnTapped, animated: true)
        
    }
    
    
    
    
   
}


extension ViewController : TbViewControllerDelegate {
    func varientName(name2: String) {
        varientLabel.text = name2
    }
    
    func makeName(name1: String) {
        makeLabel.text = name1
    }
    
    func modelName(name: String) {
        modelLabel.text = name
        print(modelLabel.text)
    }
    
    func didSelectData(result: String) {
        YearLabel.text = result
        print(YearLabel.text)
        
        
    }
    
    
    
}
