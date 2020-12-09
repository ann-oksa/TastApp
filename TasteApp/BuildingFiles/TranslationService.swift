//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

class TranslationService {
    
    let networkManager = GoogleTranslateAPIManager()
    
    func transformTranslToLanguage(text: String, targetLang: Language, sourceLang: Language,  completionHandler: @escaping (String) -> Void )  {
        
        self.networkManager.translate(text: text, targetLang: targetLang, sourceLang: sourceLang) { t in
            var result = String()
            switch t {
            case .failure(.cantCreateURL) :
                print("")
            case .failure(.noData) :
                print("")
            //case .failure(.unknownError()) :
                print("")
            case .success(let some ) :
                switch some[0] {
                case .unionArrayArray(let array) :
                    switch array[0][0] {
                    case .string(let word):
                        result = word
                    default: break
                    }
                default:
                    print("")
                }
               
            default: print("")
            }
            
            if let translation = TranslationOfWord(word: result).word as? String {
                DispatchQueue.main.async {
                    completionHandler(translation)
                }
            }
        }
    }
}
