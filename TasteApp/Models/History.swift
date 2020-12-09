//
//  History.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 07.12.2020.
//

import Foundation
// модель для хранения инфы
// главное: сллово - перевод
// хранение?
// dict[string:string]
//let history = History()
//wordLabel history.word, translationLabel history.translation





class Record {
    var word1: TranslationOfWord
    var word2: TranslationOfWord
    var partOfSpeech: String
    var pronounsing: String
}

class History {
    var journal: [Record]
}
