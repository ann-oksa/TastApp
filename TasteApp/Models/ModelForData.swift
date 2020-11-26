//
//  ModelForData.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//
//
import Foundation

struct ModelForData {
 
    let russian: String


    init?(translation: Translation) {
     
        russian = translation.data.translations.first!.translatedText!

    }

}

