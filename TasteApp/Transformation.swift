//
//  Transformation.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 30.11.2020.
//

import Foundation

struct Transformation {
    
    func transformTranslToLanguage(t: Translation) -> String? {
        let translation = Language(russian: (t.data.translations.first?.translatedText)!).russian
        return translation
     }
}
