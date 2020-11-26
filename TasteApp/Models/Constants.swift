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
        "x-rapidapi-key": "80c6a3649fmsh42f78d3c4f87910p180259jsn2bf5b117d8a6",
        "x-rapidapi-host": "google-translate1.p.rapidapi.com"
    ]
    
}

//    func translate(text: String)  {
//        let headers = [
//            "content-type": "application/x-www-form-urlencoded",
//            "accept-encoding": "application/gzip",
//            "x-rapidapi-key": "80c6a3649fmsh42f78d3c4f87910p180259jsn2bf5b117d8a6",
//            "x-rapidapi-host": "google-translate1.p.rapidapi.com"
//        ]
//
//        let postData = NSMutableData(data: "q=\(text)".data(using: String.Encoding.utf8)!)
//        postData.append("&source=en".data(using: String.Encoding.utf8)!)
//        postData.append("&target=ru".data(using: String.Encoding.utf8)!)
//
//        let request = NSMutableURLRequest(url: NSURL(string: "https://google-translate1.p.rapidapi.com/language/translate/v2")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "POST"
//        request.allHTTPHeaderFields = headers
//        request.httpBody = postData as Data
//
//      //  var result = ""
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//                guard let data = data else { return }
//                let dataString = String(data: data, encoding: .utf8)
//                print("dataString! \(dataString!)")
//                let translation = self.parseJSON(with: data)
//                print("translation!.russian \(translation!.russian)")
//       //         result = translation!.russian
//        //        print("result \(result)")
//            }
//        })
//
//        dataTask.resume()
//       // print("return result \(result)")
//      //  return result
//    }
    
    
