//
//  InterfaceController.swift
//  bus WatchKit Extension
//
//  Created by TOBARU on 2016/12/18.
//  Copyright © 2016年 TOBARU. All rights reserved.
//

import WatchKit
import Foundation
import Kanna
import Alamofire

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var testTable: WKInterfaceTable!

    var timeArray = [String]()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        print("willActivate start")
        
        
//        let headers: HTTPHeaders = ["User-Agent": "WatchKit Extension/1.0 (watchkitapp.watchkitextension; build:1; watchOS 3.1.0) "]
//        headers: headers
        
        // get html
        var html = ""
        Alamofire.request("http://loca.seibubus.co.jp/seibuloca/navis?VID=ldt&EID=nt&UKD=1&DSMK=100116&DK=31ok_244_v2tvk-31ok_244_vl6um")
            .responseString { response in

                html = response.result.value!
                
                print(html)
                
                if let doc = HTML(html: html, encoding: .utf8) {
                    
                    // HTML内のリンク(URL)を抜き出す
                    for node in doc.xpath("//*[@id='main']/div[2]/div[1]/ul/li/p[@class='result_status']"){
                        self.timeArray.append(node.text!)
                    }
                    
                    let totalnum = self.timeArray.count
                    self.testTable.setNumberOfRows(totalnum, withRowType: "TestRow")
                    
                    for index in 0..<totalnum {
                        let row = self.testTable.rowController(at: index) as! TestRow
                        row.testLabel.setText(self.timeArray[index])
                    }
                }
        }

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        
        print("didDeactivate start")
        
        self.timeArray = []
        
        // delete all rows
        let tableRowNumArr = 0...self.testTable.numberOfRows
        let indexSet = IndexSet(tableRowNumArr)
        self.testTable.removeRows(at: indexSet as IndexSet)
        
    }

}
