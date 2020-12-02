//
//  NewTranslateManager.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 01.12.2020.
//

import Foundation


struct NewTranslateManager {
    
    enum TargetLanguages: String {
        case russian = "ru"
        case english = "en"
    }
    
    func createURLComponents(text: String, targetLang: TargetLanguages, sourseLang: TargetLanguages) -> URL? {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "translate.googleapis.com"
        urlComponents.path = "/translate_a/single"
        urlComponents.queryItems = [
            URLQueryItem(name: "client", value: "gtx"),
            URLQueryItem(name: "sl", value: sourseLang.rawValue),
            URLQueryItem(name: "tl", value: targetLang.rawValue ),
            URLQueryItem(name: "q", value: text)]
        print(urlComponents.url?.absoluteURL)
        let urlString = urlComponents.url?.absoluteURL
        return urlString
        
    }
}
