//
//  InterfaceController.swift
//  bus WatchKit Extension
//
//  Created by TOBARU on 2016/12/18.
//  Copyright © 2016年 TOBARU. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var testTable: WKInterfaceTable!
    
    var test = ["aaa", "bbb", "test3", "test4", "test5"]

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        
        let totalnum = self.test.count
        print(totalnum)
        testTable.setNumberOfRows(totalnum, withRowType: "TestRow")
        print(testTable.numberOfRows)
        
        for index in 0..<totalnum {
            let row = testTable.rowController(at: index) as! TestRow
            row.testLabel.setText(test[index])
        }
        
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
