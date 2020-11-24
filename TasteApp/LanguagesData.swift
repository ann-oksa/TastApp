//
//  LanguagesData.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 24.11.2020.
//

import Foundation

// MARK: - Welcome
struct LanguagesData: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let languages: [Language]
}

// MARK: - Language
struct Language: Codable {
    let language: String
}

