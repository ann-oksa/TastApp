//
//  TranslationViewModel.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 18.01.2021.
//

import Foundation

protocol TranslationDelegate: class {
    func setValuesForOutlets(text: String)
    func setValuesOfWordsDependingOnLanguages()
}

class  TranslationViewModel {
    
    var transformation = TranslationService()
    var appState = AppState.shared
    let constants = IdentifiersForSegue()
    
    weak var delegate: TranslationDelegate?
    
    
    func changeLanguageDependingOnTheIndex(index: Int) {
        appState.changeLanguageDependingOnTheIndex(index: index)
    }
    
    func newtransformTranslationToLanguage(text: String, targetLanguage: Language, sourceLanguage: Language) {
        transformation.transformTranslationToLanguage(text: text, targetLanguage: targetLanguage, sourceLanguage: sourceLanguage) { translatedText in
            self.delegate?.setValuesForOutlets(text: translatedText)
            self.delegate?.setValuesOfWordsDependingOnLanguages()
        }
    }
    
    func createRecord(word1: String, word2: String) {
        appState.createRecord(word1: word1, word2: word2)
    }
}
