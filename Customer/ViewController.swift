//
//  ViewController.swift
//  Customer
//
//  Created by Joe on 23/09/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit
let validCustomerUrl = "http://crmservice.rbcentre.com/api/CRMMobApp/GetValidUser"
//let validCustomerUrl = "http://www.mocky.io/v2/5ed7e5123200003def274d22"
class ViewController: UIViewController, GetPackagesDelegate {
    let networkCaller = NetworkCallHandler()
    func responseFromApi(responseData: Any) {
        do{
        let resp = responseData as! MainDataStruct
            print("data from responseFromApi", resp.Result)
        if (resp.Flag != 1) {
            
        }
        else{
            DispatchQueue.main.async {
            let packageController =
            self.storyboard?.instantiateViewController(withIdentifier: "PackageListViewController")
                as! PackageListViewController
            self.navigationController?.pushViewController(packageController, animated: true)
                packageController.self.username = resp.Result.cName
                packageController.self.guid = resp.Result.guId
            }
            }
            
        }
        catch
        {
        print("error occured while navigation")
        }
        
    }
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var rbcLogo: UIImageView!
    @IBOutlet weak var phoneNumberTexbox: UITextField!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkCaller.packageDeligate = self
        
    }

    @IBAction func LoginButton(_ sender: Any) {
        self.networkCaller.requestApiResponse(url: validCustomerUrl,phone: phoneNumberTexbox.text!, DataStruct: CustomerStruct.selectLogin)
    }
    
}

