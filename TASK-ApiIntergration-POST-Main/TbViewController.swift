//
//  TbViewController.swift
//  TASK-ApiIntergration-POST-Main
//
//  Created by Ananth Nair on 19/08/23.
//

import UIKit

class TbViewController: UIViewController {

    var buttonTapped : Int?
    
    @IBOutlet weak var tableViewtb: UITableView!
    
    var firstVC : ViewController?
    var delegate : TbViewControllerDelegate?
    
    let year : [String] =  ["2012","2013","2014","2015","2016","2017","2018","2019","2020","2021","2022","2023"]
    var jsonData : Root?
    var jsonData1 : Root1?
    var jsonData2 : Root2?
    
    var yearLbl : String?
    var makeLbl : String?
    var madeLbl : String?
    var varientLbl : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if buttonTapped == 2 {
            getMakeResponse()
        }
        if buttonTapped == 3 {
            getModelResponse()
        }
        if buttonTapped == 4 {
            getVairentResponse()
        }
    }
    
    //MARK: MAKE RESPONSE
    
    func getMakeResponse(){
        
        print("MAKE RESPONSE")
        let url = "https://kuwycredit.in/servlet/rest/ltv/forecast/ltvMakes"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let param : [String:Any] = ["year":yearLbl as Any]
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
                            self.tableViewtb.reloadData()
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
    
        let url = "https://kuwycredit.in/servlet/rest/ltv/forecast/ltvModels"
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var param : [String:Any] = ["year":yearLbl,"make":madeLbl]
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
                            self.tableViewtb.reloadData()
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
        let url = "https://kuwycredit.in/servlet/rest/ltv/forecast/ltvVariants"
        
        let request = NSMutableURLRequest(url: NSURL(string: url)! as URL)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        var param : [String:Any] = ["year":yearLbl,"make":madeLbl,"model":makeLbl]
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
                            self.tableViewtb.reloadData()
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
extension TbViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if buttonTapped == 1  {
                delegate?.didSelectData(result: year[indexPath.row])
                self.dismiss(animated: true)
                delegate?.makeName(name1: "")
                delegate?.modelName(name: "")
                delegate?.varientName(name2: "")
            }
            else  if buttonTapped == 2  {
                delegate?.modelName(name: (jsonData?.makeList[indexPath.row])!)
                self.dismiss(animated: true)
            }
            if buttonTapped == 3 {
                delegate?.makeName(name1: (jsonData1?.modelList[indexPath.row])!)
                self.dismiss(animated: true)
            }
            if buttonTapped == 4 {
                delegate?.varientName(name2: (jsonData2?.variantList[indexPath.row])!)
                self.dismiss(animated: true)
            }
    
        }
    
}

extension TbViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           if buttonTapped == 1 {
               return (year.count)
           }
           else if  buttonTapped == 2 {
               return jsonData?.makeList.count ?? 0
           } else if buttonTapped == 3 {
               return jsonData1?.modelList.count ?? 0
           } else if buttonTapped == 4 {
               return jsonData2?.variantList.count ?? 0
           }
           return 0
       }
   
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let vc = tableView.dequeueReusableCell(withIdentifier: "cell")! as! TableViewCell
           if buttonTapped == 1 {
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
protocol TbViewControllerDelegate {
    func didSelectData(result:String)
    func modelName(name:String)
    func makeName(name1:String)
    func varientName(name2:String)
}
