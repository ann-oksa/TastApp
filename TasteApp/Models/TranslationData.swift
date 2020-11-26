//
//  LanguagesData.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

// MARK: - Translation
struct Translation: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let translations: [TranslationElement]
}

// MARK: - TranslationElement
struct TranslationElement: Codable {
    let translatedText: String?
}

