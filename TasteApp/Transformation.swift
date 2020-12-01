//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

class Transformation {
    
    let networkManager = GoogleTranslateAPIManager()
    
    // ! +
    // empty textField +
    // new code to hack google api
    // brush code
    
    
    func transformTranslToLanguage(text: String, completionHandler: @escaping (String) -> Void? )  {
        self.networkManager.translate(text: text) { t in
            guard let result = t?.data.translations.first?.translatedText else { return }
            if let translation = Language(russian: result).russian as? String {
                DispatchQueue.main.async {
                    completionHandler(translation)
                }
            }
        }
    }
}
