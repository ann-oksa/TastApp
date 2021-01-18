//
//  TasteAppTests.swift
//  TasteAppTests
//
//  Created by Anna Oksanichenko on 15.01.2021.
//

import XCTest
@testable import TasteApp

class TasteAppTests: XCTestCase {

    let record = Record(word1: "record", word2: "запись")
    let history = History()
    
    override func setUpWithError() throws {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreateRecordInHistory() {
        let record = Record(word1: "record", word2: "запись")
        
    }
    
    func testAddRecordToHistory() {
        history.journal.append(record)
        let result = history.journal.first(where: {$0 === record})?.word1
        XCTAssertEqual(result, record.word1 , "Record doesn`t append in journal")
    }
    
//    func testAddRecordToHistoryWithFailureResult() {
//        history.journal.append(record)
//        let result = history.journal.first(where: {$0 === record})?.word2
//        XCTAssertEqual(result, record.word1 , "Record doesn`t append in journal")
//    }
    
    func testRemoveRecordFromHistory() {
        history.journal.append(record)
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === record}) else { return  }
        history.journal.remove(at: indexOfRecord)
        XCTAssertEqual(history.journal.count, 6, "Record Doesn`t remove from journal")
    }
    
    func testfuncSaveChangesInHistory() {
        let word1 = "records"
        let word2 = "записи"
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === record}) else { return  }
        history.journal[indexOfRecord].word1 = word1
        history.journal[indexOfRecord].word2 = word2
        let result = Record(word1: history.journal[indexOfRecord].word1, word2: history.journal[indexOfRecord].word2).word1
        
        XCTAssertEqual(result, "records", "Words in this records didn`t change")
    }
    
    func testSetSomeCardTitle() {
        
        var someCardTitle = ""
        var currentIndexOfCard = 0
        someCardTitle =  history.journal[currentIndexOfCard].word1
        let result  = someCardTitle
        XCTAssertEqual(result, "bananapapa", "wrong")
    }
    
    func testChangeLanguageIfIndexIsZero() {
        let index = 0
        AppState.shared.targetLanguage = .english
        let result = AppState.shared.targetLanguage
        XCTAssertEqual(result, .english, "wrong")
    }
    
    func testChangeLanguageIfIndexIsOne() {
        let index = 1
        AppState.shared.targetLanguage = .russian
        let result = AppState.shared.targetLanguage
        XCTAssertEqual(result, .russian, "wrong")
    }

}
