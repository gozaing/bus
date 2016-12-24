//
//  InterfaceController.swift
//  bus WatchKit Extension
//
//  Created by TOBARU on 2016/12/18.
//  Copyright © 2016年 TOBARU. All rights reserved.
//

import WatchKit
import Foundation
//import HTMLReader
import Kanna
import Alamofire


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var testTable: WKInterfaceTable!
    
//    var test = ["111aaa", "bbb", "test3", "test4", "test5"]
    var test = [String]()

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // get html
        print("start")
        var html = ""
        Alamofire.request("http://loca.seibubus.co.jp/seibuloca/navis?VID=ldt&EID=nt&UKD=1&DSMK=100116&DK=31ok_244_v2tvk-31ok_244_vl6um")
            .responseString { response in
                html = response.result.value!
          
                print("------------")
                print(html)
                print("------------")
                
                if let doc = HTML(html: html, encoding: .utf8) {
                    print(doc)
                    //print(doc.title)
                    print("------------end---")
                    
                    // HTML内のリンク(URL)を抜き出す
                    //for node in doc.xpath("//*[@id='section_link']/ul/li/a")
                    //for node in doc.xpath("//*[@id='main']/div[2]/div[1]/ul[1]/li/p[2]"){ Optional("時刻表：20:48")
                    for node in doc.xpath("//*[@id='main']/div[2]/div[1]/ul/li/p[@class='result_status']"){ //
                        //print(node["p"])  // href属性に設定されている文字列を出力
                        //print(node["href"])  // Optional("#section1")

                        // print(node["a"]) // nil
                        // print(node["text()"]) // nil
                        //print(node["a/text()"])
                        print("----start----")
                        // print(node.text) Optional("時刻表：20:48")
                        print(node.text!)
                        self.test.append(node.text!)
                        
                    }
                    
                    let totalnum = self.test.count
                    print(totalnum)
                    self.testTable.setNumberOfRows(totalnum, withRowType: "TestRow")
                    print(self.testTable.numberOfRows)
                    
                    for index in 0..<totalnum {
                        let row = self.testTable.rowController(at: index) as! TestRow
                        row.testLabel.setText(self.test[index])
                    }

                    
                }
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        print("willActivate start")

    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
