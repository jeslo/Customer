//
//  NetworkCallHandler.swift
//  Customer
//
//  Created by Joe on 23/09/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit
enum CustomerStruct {
    case selectLogin
    case selectPackages
}
protocol GetPackagesDelegate {
    func responseFromApi(responseData: Any)
}
class NetworkCallHandler: UIViewController {
    var packageDeligate: GetPackagesDelegate!
    var StruForMain: MainDataStruct!
    func requestApiResponse(url: String,phone: String, DataStruct: CustomerStruct)
      {
             let parameterDictionary = ["phone" : phone]
        guard let serviceUrl = URL(string: url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "POST"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        guard let httpBody = try? JSONEncoder().encode(parameterDictionary) else {return}
        request.httpBody = httpBody
        let session = URLSession.shared
               session.dataTask(with: request) { (data, response, error) in
                   if let response = response {
                    print(">>>>>>>>>>>>>",response)
                    
                   }
                   if let data = data {
                       do {
                        let parsedData = try JSONDecoder().decode(MainDataStruct.self, from: data )
                        self.packageDeligate.responseFromApi(responseData: parsedData)
                       } catch {
                           print("No packages available")
                        self.packageDeligate.responseFromApi(responseData: 0)
                        
                       }
                   }
                   }.resume()

        }
    
}
