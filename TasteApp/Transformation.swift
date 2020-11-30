//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

class Transformation {
    
    let networkManager = NetworkManager()
   var result = String()
    
     func transformTranslToLanguage(text: String) -> String? {
        self.networkManager.translate(text: text) { t in
            self.result = (t?.data.translations.first?.translatedText!)!
        }
        let translation = Language(russian: result).russian
       print("transformation \(translation)")
        return translation
     }
}
