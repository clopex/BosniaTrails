//
//  WebViewVC.swift
//  MtbBosnia
//
//  Created by Adis Mulabdic on 3/7/16.
//  Copyright © 2016 Adis Mulabdic. All rights reserved.
//

import UIKit

class WebViewVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var url: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let mainUrl = NSURL(string: url)
        let requestObj = NSURLRequest(URL: mainUrl!)
        webView.loadRequest(requestObj)
       
    }


}
