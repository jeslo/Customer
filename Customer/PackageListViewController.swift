//
//  PackageListViewController.swift
//  Customer
//
//  Created by Joe on 23/09/20.
//  Copyright © 2020 jess. All rights reserved.
//

import UIKit
let packageUrl = "http://crmservice.rbcentre.com/api/CRMMobApp/GetPakagesByUser"

class PackageListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var packageTableView: UITableView!
    var username: String = ""
    var guid: String = ""
    override func viewDidLoad() {
        packageTableView.delegate = self
        packageTableView.dataSource = self
        super.viewDidLoad()
        print(username)
        self.userNameLabel.text = "Welcome "+username
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let packagedata = self.packageTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PackageViewCell
        packagedata.packageNameLabel?.text = "Hello World"
        return packagedata
    }
    
}
