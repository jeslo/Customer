//
//  MainDataStruct.swift
//  Customer
//
//  Created by Joe on 24/09/20.
//  Copyright © 2020 jess. All rights reserved.
//
import Foundation
struct MainDataStruct: Decodable {
    var Flag : Int
    var Result: Result
}
struct Result : Decodable {
    var guId: String
    var cName: String
    var Phone: String
    var Email: String
    var msg: String
}
