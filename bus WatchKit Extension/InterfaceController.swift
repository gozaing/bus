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
    
    var test = ["111aaa", "bbb", "test3", "test4", "test5"]

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // get html
        //let html = "<html>...</html>"
        var html = "<html>...</html>"
        //let html = "http://httpbin.org/ip"
        //let html = "https://cocoapods.org/pods/HTMLReader"
        //let html = "<html>...</html>"
        
        // これだとtitle取れる
        //let html = "<html><head><title>aaaa</title></head><body></body></html>"
        //let html = "<!DOCTYPE html>\r\n<html>\r\n<head>\r\n\t\r\n\r\n\t<meta http-equiv=\"Content-Type\" content=\"text/html; charset=Shift_JIS\" >\r\n\t\r\n\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=0.80\">\r\n\t<meta name=\"keywords\" content=\"バス,GPS,時刻表,案内,ロケーション,西武バス\">\r\n\t<meta name=\"description\" content=\"バスのリアルタイム運行案内を調べます。\">\r\n\r\n\t\r\n\r\n\r\n\r\n\r\n\t<title>西武バスロケ&nbsp;|&nbsp;停留所を指定して検索（検索結果）</title>\r\n\r\n\t\r\n\r\n\r\n\t<link rel=\"stylesheet\" href=\"buslocation/sp/css/jquery.mobile-1.3.0.min.css\" />\r\n\t<link rel=\"stylesheet\" href=\"buslocation/sp/css/busloca.css\" />\r\n\t\r\n\t<script type=\"text/javascript\" src=\"buslocation/sp/js/jquery-1.8.2.min.js\" charset=\"Shift_JIS\"></script>\r\n\t\r\n\t<script type=\"text/javascript\">\r\n\t<!--\r\n\t\t$(document).bind(\"mobileinit\", function()\r\n\t\t{\r\n\t\t\t$.mobile.page.prototype.options.theme=\"b\";\r\n\t\t\t\r\n\t\t\t$.mobile.page.prototype.options.headerTheme = \"b\";\r\n\t\t\t\r\n//\t\t\t$.mobile.page.prototype.options.contentTheme = \"b\";\r\n\t\t\t$.mobile.page.prototype.options.footerTheme = \"b\";\r\n\t\t\t\r\n\t\t\t$.mobile.ajaxEnabled = false;\r\n\t\t});\r\n\t-->\r\n\t</script>\r\n\t<script type=\"text/javascript\" src=\"buslocation/sp/js/jquery.mobile-1.3.0.min.js\" charset=\"Shift_JIS\"></script>\r\n\t<script type=\"text/javascript\" src=\"buslocation/sp/js/busloca_lib.js\" charset=\"Shift_JIS\"></script>\r\n\t\r\n\t\r\n\t\r\n\rg) == \"undefined\" || msg == \"null\" )\r\n\t\t\t{\r\n\t\t\t\tmsg = \"\";\r\n\t\t\t\tis_start_scroll = false;\r\n\t\t\t}\r\n\t\t\telse\r\n\t\t\t{\r\n\t\t\t\tis_start_scroll = true;\r\n\t\t\t}\r\n\t\t\t\r\n\t\t\t//メッセージセット\r\n\t\t\tsetMsg(msg);\r\n\t\r\n\t\t\t//スクロール開始\r\n\t\t\tif ( is_start_scroll )\r\n\t\t\t{\r\n\t\t\t\tsetInterval(\'scrollMsg()\',500);\r\n\t\t\t}\r\n\t\t\t\r\n\t\t} );\r\n\t-->\r\n\t</script>\r\n</head>\r\n\r\n<body>\r\n\t<!-- page -->\r\n\t<div id=\"main\" data-role=\"page\" data-position=\"inline\">\r\n\t<!-- header -->\r\n\t\t\r\n\r\n\r\n\r\n\r\n\r\n\t<div data-role=\"header\" data-position=\"inline\" >\r\n\t\t<div class=\"header_container\">\r\n\t\t\t<div>\r\n\t\t\t\t<a href=\"http://loca.seibubus.co.jp/seibuloca/navis?VID=rsp&EID=hm&UKD=1\" data-icon=\"home\" data-ajax=\"false\"><img src=\"buslocation/sp/images/title.png\"></a>\r\n\t\t\t</div>\r\n\t\t\t<div class=\"news_container\">\r\n\t\t\t<form name=\"info\" action=\"\" method=\"get\">\r\n\t\t\t\t<input readonly=\"readonly\" name=\"banner\" id=\"banner\" type=\"text\" value=\"\" onfocus=\"this.blur();\" />\r\n\t\t\t</form>\r\n\t\t\t</div>\r\n\t\t\t<div>検索結果(00:49)</div>\r\n\t\t</div>\r\n\t</div>\r\n\r\n\t<!-- /header -->\r\n\t\r\n\t<!-- content -->\r\n\t\t<div data-role=\"content\" >\r\n\t\t<form name=\"SubmitForm\" action=\"navis\" method=\"get\" onsubmit=\"return false;\">\r\n\t\t\t<input type=\"hidden\" name=\"VID\" value=\"\">\r\n\t\t\t<input type=\"hidden\" name=\"EID\" value=\"\">\r\n\t\t\t<input type=\"hidden\" name=\"UKD\" value=\"1\">\r\n\t\t\t<input type=\"hidden\" name=\"DSMK\" value=\"0\">\r\n\t\t\t\r\n\t\t</form>\r\n\t\r\n\t\t\t<!-- 検索エラー -->\r\n\t\t\t\r\n\r\n\r\n\r\n\r\n\r\n\r\n\t<div class=\"alert_container\">\r\n\t\t<div clat\t<div data-role=\"navbar\">\r\n\t\t\t<ul>\r\n\t\t\t\t<li><a href=\"http://loca.seibubus.co.jp/seibuloca/navis?VID=rsp&EID=bk&UKD=1\" data-icon=\"back\" data-ajax=\"false\">戻る</a></li>\r\n\t\t\t\t<li><a href=\"http://loca.seibubus.co.jp/seibuloca/navis?VID=rsp&EID=hm&UKD=1\" data-icon=\"home\" data-ajax=\"false\">トップ</a></li>\r\n\t\t\t\t<li><a href=\"http://loca.seibubus.co.jp/seibuloca/navi?UKD=1\" data-icon=\"star\" data-ajax=\"false\">PCサイトへ</a></li>\r\n\t\t\t</ul>\r\n\t\t</div>\r\n\t\t<!-- /navbar -->\r\n\t\t\r\n\t\t<div>\r\n\t\t\t<p class=\"footer_copyright\">Copyright&copy; SeibuBus Co.,Ltd. All Rights Reserved.</p>\r\n\t\t</div>\r\n\t</div>\r\n<!-- /footer -->\r\n\t\r\n\t<!-- /footer -->\r\n\t</div>\r\n\t<!-- /page -->\r\n</body>\r\n</html>"
        //Alamofire.request(.GET, "https://cocoapods.org/pods/HTMLReader")
        //Alamofire.request("https://cocoapods.org/pods/HTMLReader")
        
        //Alamofire.request("https://httpbin.org/get").responseJSON { response in
        
        Alamofire.request("https://httpbin.org/get").responseJSON { response in
            //print(response.request)  // original URL request
            //print(response.response) // HTTP URL response
            //print(response.data)     // server data
            //print(response.result)   // result of response serialization
            
            
            if let JSON = response.result.value {
                //print("JSON: \(JSON)")
            }
        }
        print("----")
        //Alamofire.request("https://ampbyexample.com/") // これでhtml取れた。https
        Alamofire.request("http://loca.seibubus.co.jp/seibuloca/navis?VID=ldt&EID=nt&UKD=1&DSMK=100116&DK=31ok_244_v2tvk-31ok_244_vl6um")
            .responseString { response in
                //print("Response String: \(response.result)")
                //print("Response String: \(response.result.value)")
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
                        print(node.text)
                        
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
        
        
        //let doc = HTML(html: html, encoding: .utf8)
        //print(doc)
        //print("------------")
        //print(html)
        
        if let doc = HTML(html: html, encoding: .utf8) {
            print(doc)
            print(doc.title)
            
            
            // HTML内のリンク(URL)を抜き出す
            for node in doc.css("a, link") {
                print(node["href"])  // href属性に設定されている文字列を出力
            }
            
            
            // Search for nodes by CSS
            for link in doc.css("a, link") {
                print(link.text)
                print(link["href"])
            }
            
            // Search for nodes by XPath
            for link in doc.xpath("//a | //link") {
                print(link.text)
                print(link["href"])
            }
        }
        
        
        // perse
        
        
        // Configure interface objects here.
        
        //let totalnum = self.test.count
        //print(totalnum)
        //testTable.setNumberOfRows(totalnum, withRowType: "TestRow")
        //print(testTable.numberOfRows)
        
        //for index in 0..<totalnum {
        //    let row = testTable.rowController(at: index) as! TestRow
        //    row.testLabel.setText(test[index])
        //}
        
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
