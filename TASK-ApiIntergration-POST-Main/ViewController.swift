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
    
    let year : [String] =  ["2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
    var buttonTapped : Int?
    var jsonData : Root?
    var jsonData1 : Root1?
    var jsonData2 : Root2?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func yearBtnTapped(_ sender: UIButton) {
        buttonTapped = 1
        tableView.isHidden = false
        self.tableView.reloadData()
        
    }
    @IBAction func makeBtnTapped(_ sender: UIButton) {
        buttonTapped = 2
        tableView.isHidden = false
        getMakeResponse()
        self.tableView.reloadData()
    }
    @IBAction func modelBtnTapped(_ sender: UIButton) {
        buttonTapped = 3
        tableView.isHidden = false
        getModelResponse()
        self.tableView.reloadData()
    }
    @IBAction func varientBtnTapped(_ sender: UIButton) {
        buttonTapped = 4
        tableView.isHidden = false
        getVairentResponse()
        self.tableView.reloadData()
    }
    
    //MARK: MAKE RESPONSE
    
    func getMakeResponse(){
        
        print("MAKE RESPONSE")
        print("YearLabel----->\(YearLabel.text!)")
        let url = "https://kuwycredit.in/servlet/rest/ltv/forecast/ltvMakes"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var param : [String:Any] = ["year":YearLabel.text]
        print("yearValueyearValue \(YearLabel.text)")
        do{
            request.httpBody =  try JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest ,completionHandler: {(data, response, error) in
                
                // response
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print("statusCode ----->>>> \(statusCode)")
                    
                }
                // error
                if let error = error {
                    print(error)
                }
                // data
                if let data = data {
                    do {
                        let content = try? JSONDecoder().decode(Root.self, from: data)
                        self.jsonData = content
                        print(content as Any)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            })
            task.resume()
            
        }
        catch {
            print("somting is went wrong ")
        }
        
    }
    
    //MARK: MODEL RESPONSE
    
    func getModelResponse(){
        print("MODEL RESPONSE")
        print("YearLabel----->\(YearLabel.text!)")
        //print("ModelLabel----->\(modelLabel.text!)")
        let url = "https://kuwycredit.in/servlet/rest/ltv/forecast/ltvModels"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var param : [String:Any] = ["year":YearLabel.text,"make":modelLabel.text]
        print("modelLabel.text------>>>\(modelLabel.text)")
        print("yearValueyearValue \(YearLabel.text)")
        print("yearandMake\(["year":YearLabel.text!,"make":modelLabel.text!])")
        do{
            request.httpBody =  try JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest ,completionHandler: {(data, response, error) in
                
                // response
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print("statusCode ----->>>> \(statusCode)")
                    
                }
                // error
                if let error = error {
                    print(error)
                }
                // data
                if let data = data {
                    do {
                        let content = try? JSONDecoder().decode(Root1.self, from: data)
                        self.jsonData1 = content
                        print(content as Any)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            })
            task.resume()
            
        }
        catch {
            print("somting is went wrong ")
        }
        
    }
    
    //MARK: VARIENT RESPONSE
    
    func getVairentResponse(){
        print("VARIENT RESPONSE")
        print("YearLabel----->\(YearLabel.text!)")
        //print("ModelLabel----->\(modelLabel.text!)")
        let url = "https://kuwycredit.in/servlet/rest/ltv/forecast/ltvVariants"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var param : [String:Any] = ["year":YearLabel.text,"make":modelLabel.text,"model":makeLabel.text]
        print("modelLabel.text------>>>\(String(describing: modelLabel.text))")
        print("yearValueyearValue \(YearLabel.text)")
        print("yearandMake\(["year":YearLabel.text!,"make":modelLabel.text!,"model":makeLabel.text!])")
        do{
            request.httpBody =  try JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions())
            let task = URLSession.shared.dataTask(with: request as URLRequest ,completionHandler: {(data, response, error) in
                
                // response
                if let response = response {
                    let nsHTTPResponse = response as! HTTPURLResponse
                    let statusCode = nsHTTPResponse.statusCode
                    print("statusCode ----->>>> \(statusCode)")
                    
                }
                // error
                if let error = error {
                    print(error)
                }
                // data
                if let data = data {
                    do {
                        let content = try? JSONDecoder().decode(Root2.self, from: data)
                        self.jsonData2 = content
                        print(content as Any)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                    catch {
                        print(error)
                    }
                }
            })
            task.resume()
            
        }
        catch {
            print("somting is went wrong ")
        }
        
    }
    
}
//MARK: DELEGATE AND DATASOURCE

extension ViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if buttonTapped == 1 {
            YearLabel.text = year[indexPath.row]
            tableView.isHidden = true
        }
        if buttonTapped == 2 {
            modelLabel.text = jsonData?.makeList[indexPath.row]
            tableView.isHidden = true
        }
        if buttonTapped == 3 {
            makeLabel.text = jsonData1?.modelList[indexPath.row]
            tableView.isHidden = true
        }
        if buttonTapped == 4 {
            varientLabel.text = jsonData2?.variantList[indexPath.row]
            tableView.isHidden = true
        }
        
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if buttonTapped == 1 {
            return year.count
        }
        else if  buttonTapped == 2 {
            return jsonData?.makeList.count ?? 0
        } else if buttonTapped == 3 {
            return jsonData1?.modelList.count ?? 0
        } else if buttonTapped == 4 {
            return jsonData2?.variantList.count ?? 0
        }
        print("buttonTapped------>\(buttonTapped)")
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let vc = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCell
        if buttonTapped == 1 {
            print(buttonTapped)
            vc.textLabel?.text = year[indexPath.row]
        }
        if buttonTapped == 2 {
            print(buttonTapped!)
            vc.textLabel?.text = jsonData?.makeList[indexPath.row]
        }
        if buttonTapped == 3 {
            print(buttonTapped!)
            vc.textLabel?.text = jsonData1?.modelList[indexPath.row]
        }
        if buttonTapped == 4 {
            print(buttonTapped!)
            vc.textLabel?.text = jsonData2?.variantList[indexPath.row]
        }
        return vc
    }
}

