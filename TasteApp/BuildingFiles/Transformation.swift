//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

class Transformation {
    
    let networkManager = GoogleTranslateAPIManager()
    
    func transformTranslToLanguage(text: String, targetLang: TargetLanguages, sourceLang: TargetLanguages,  completionHandler: @escaping (String) -> Void )  {
        
        self.networkManager.translate(text: text, targetLang: targetLang, sourceLang: sourceLang) { t in
            var result = String()
            switch t?.first {
            case .unionArrayArray(let array):
                switch array[0][0] {
                case .string(let s):
                    result = s
                default:
                    print("Nothing")
                }
                break
            default:
                print("can't find a translation")
                break
            }
            
            if let translation = Language(russian: result).russian as? String {
                DispatchQueue.main.async {
                    completionHandler(translation)
                }
            }
        }
    }
}
