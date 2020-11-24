//
//  ModelForData.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//
//
//import Foundation
//
//struct ModelForData {
//    let english: Language
//    let russian: Language
//
//
//    init?(languagesData: LanguagesData) {
//       english = languagesData.data.languages[16]
//        russian = languagesData.data.languages[76]
//
//    }
//
//}

import Foundation

let headers = [
    "content-type": "application/x-www-form-urlencoded",
    "accept-encoding": "application/gzip",
    "x-rapidapi-key": "80c6a3649fmsh42f78d3c4f87910p180259jsn2bf5b117d8a6",
    "x-rapidapi-host": "google-translate1.p.rapidapi.com"
]

let postData = NSMutableData(data: "q=English is hard, but detectably so".data(using: String.Encoding.utf8)!)

let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2/detect")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "POST"
request.allHTTPHeaderFields = headers
request.httpBody = postData as Data

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
    if (error != nil) {
        print(error)
    } else {
        let httpResponse = response as? HTTPURLResponse
        print(httpResponse)
    }
})

dataTask.resume()
