//
//  DetailViewController.swift
//  JSONInterpreter
//
//  Created by AppDev on 20/04/18.
//  Copyright © 2018 Droal. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    var wkWebView : WKWebView!
    var detailItem: [String : String]!
    
    
    override func loadView() {
        wkWebView = WKWebView()
        view = wkWebView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //validacion del diccionario, si este es nulono continua
        guard detailItem != nil else {return}
        
        //crea un string con etiquetas html para visualizar el body del JSON en un WebView
        if let bodyJson = detailItem["body"]{
            var html = "<html>"
                html += "<head>"
                html += "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">"
                html += "<style> body { font-size: 150%; } </style>"
                html += "</head>"
                html += "<body>"
                html += bodyJson
                html += "</body>"
                html += "</html>"
            wkWebView.loadHTMLString(html, baseURL: nil)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
