//
//  ViewController.swift
//  GSTChecker
//
//  Created by Megasap on 4/16/15.
//  Copyright (c) 2015 afiq. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkGSTByBizRegNo("419060-A")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkGSTByBizRegNo(bisnesRegistrationNumber:NSString) -> Void {
        Alamofire.request(.GET, "http://gst.amry.my/api/BizRegNo/\(bisnesRegistrationNumber)").responseJSON { (_, _, JSON, _) in
            //                println(JSON!)
            let resultsArray:NSArray = JSON as NSArray
            let gstResults:NSDictionary = resultsArray[0] as NSDictionary
            let bisnesName:NSString = gstResults["BusinessName"] as NSString
            let commenceDate:NSString = gstResults["CommenceDate"] as NSString
            let gstNumber:NSString = gstResults["GstNumber"] as NSString
            let gstStatus:NSString = gstResults["Status"] as NSString
            
            println("Business Name : \(bisnesName)")
            println("Start Date : \(commenceDate)")
            println("GST Number : \(gstNumber)")
            println("GST Status : \(gstStatus)")
        }
    }


}

