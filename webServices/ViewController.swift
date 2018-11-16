//
//  ViewController.swift
//  webServices
//
//  Created by sivakumar on 15/11/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    override func viewDidLoad() {
        
      
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        

      getData()
    }

    func getData(){
        
        
        let myURL = "https://www.brninfotech.com/pulse/modules/admin/ValidateLogin.php"
        let params : [String : Any] = ["funcName" : "verifyLogin", "registeredEmail" : "svkumar108@gmail.com", "registeredPassword" : "1993/sep/10"]
        
        Alamofire.request(myURL, method: .post, parameters: params).responseJSON {
            response in
            if response.result.isSuccess {
                
                let data : JSON = JSON(response.result.value!)
                let imgData = data["profileImagePath"].string
                
                //let myImg:UIImage = UIImage(data:  try! Data(contentsOf: URL(string: imgData!)!))!
               // self.imgView.image = myImg
                
           //     let imagPath = URL(fileURLWithPath: imgData!)
             //  let myImg = UIImage(contentsOfFile: imgData!)
             //   self.imgView.image = myImg
                print(data)
                
            }else{
                print("error")
            }
        }
        
        
    }
}

