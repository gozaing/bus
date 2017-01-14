//
//  InterfaceController_2.swift
//  bus
//
//  Created by TOBARU on 2017/01/14.
//  Copyright © 2017年 TOBARU. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire

class InterfaceController_2: WKInterfaceController {

    let okSentButtonAction = WKAlertAction(title:"OK", style: .default) { () -> Void in
        print("ok sent")
    }

    let okButtonAction = WKAlertAction(title:"OK", style: .default) { () -> Void in
        // OKボタンが押された時の処理
        print("ok button")
        
        var html = ""
        
        let headers: HTTPHeaders = ["User-Agent": "WatchKit Extension/1.0 (watchkitapp.watchkitextension; build:1; watchOS 3.1.0) "]
        
//        Alamofire.request("http://requestb.in/rcwq6crc", headers: headers)
//            .responseString { response in
//                
//                html = response.result.value!
//                print(html)
//                
//        }
    }
    
    let cancelButtonAction = WKAlertAction(title:"キャンセル", style: .default) { () -> Void in
        // キャンセルボタンが押された時の処理
        print("cancel button")
    }
    
    @IBAction func sendMessage() {
        print("push button")
        
        // ボタンを縦並びにする
        presentAlert(withTitle: "ChatWork", message:"送る？", preferredStyle: .alert, actions: [okButtonAction, cancelButtonAction]);
        
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        print("will activate 2")
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
