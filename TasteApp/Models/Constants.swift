//
//  Constants.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 26.11.2020.
//

import Foundation

struct Constants {
    
    

    
    let headers = [
        "content-type": "application/x-www-form-urlencoded",
        "accept-encoding": "application/gzip",
        "x-rapidapi-key": "501f705f4fmsh22d97b2fab3039bp198dc4jsn9b9caee1e1fe",
        "x-rapidapi-host": "google-translate1.p.rapidapi.com"
    ]
    
    let currentURL = URL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")
    
    
    func postData(text: String) -> NSMutableData {
        let postData = NSMutableData(data: "q=\(text)".data(using: String.Encoding.utf8)!)
        postData.append("&source=en".data(using: String.Encoding.utf8)!)
        postData.append("&target=ru".data(using: String.Encoding.utf8)!)
        return postData
    }
}


