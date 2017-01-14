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
        
        //let url: String = "http://requestb.in/rcwq6crc"
        let url: String = "https://api.chatwork.com/v1/rooms/xxxxx/messages"
        
        let headers: HTTPHeaders = [
            "User-Agent": "WatchKit Extension/1.0 (watchkitapp.watchkitextension; build:1; watchOS 3.1.0) ",
            "X-ChatWorkToken": "xxxxx"
        ]
        
        let msg: String = "【業務連絡】\n這うような辛さがあり、30分遅れます。\n \"Apple Watch\"から送信"
        let parameters: Parameters = ["body": msg]
        
        
        Alamofire.request(url, method: .post, parameters: parameters, headers: headers)
            .responseString { response in
                
                html = response.result.value!
                print(html)
                
        }
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
