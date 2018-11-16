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
        
        
        let myURL = "http://bharathiyam.org/RestserviceAPI/Gettempledescription/1/4"
        
        Alamofire.request(myURL, method: .get).responseJSON {
            response in
            if response.result.isSuccess {
                
                let data : JSON = JSON(response.result.value!)
                let imgData = data["TempleDescriptionResult"]["Gallery"][0]["event_image"].string
            
              
                
                let myimage : UIImage = UIImage(data: try! Data(contentsOf: URL(string: imgData!)!))!
                
              self.imgView.image = myimage
                
                
                print(data)
                
                
            }else {
                print("error")
            }
        }
        
        
    }
}

