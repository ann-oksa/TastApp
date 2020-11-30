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
    var onCompletion: ((String?) -> Void)?
    
    
    func transformTranslToLanguage(text: String, completionHandler: @escaping (String) -> Void? ) -> String? {
        self.networkManager.translate(text: text) { t in
            self.result = (t?.data.translations.first?.translatedText!)!
        }
        if let translation = Language(russian: result).russian {
            self.onCompletion?(translation)
        }
       print("transformation \(translation)")
        
        print("completionHandler \(onCompletion)")
        return translation
     }
}
