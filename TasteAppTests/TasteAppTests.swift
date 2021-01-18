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
    let shared = AppState.shared
    
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
    
  
    func testAddRecordToHistory() throws {
        history.journal.append(record)
        let result = history.journal.first(where: {$0 === record})?.word1
        XCTAssertEqual(result, record.word1 , "Record doesn`t append in journal")
    }
    
//    func testAddRecordToHistoryWithFailureResult() {
//        history.journal.append(record)
//        let result = history.journal.first(where: {$0 === record})?.word2
//        XCTAssertEqual(result, record.word1 , "Record doesn`t append in journal")
//    }
    
    func testRemoveRecordFromHistory() throws {
        history.journal.append(record)
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === record}) else { return  }
        history.journal.remove(at: indexOfRecord)
        XCTAssertEqual(history.journal.count, 6, "Record Doesn`t remove from journal")
    }
    
    func testfuncSaveChangesInHistory() throws {
        let word1 = "records"
        let word2 = "записи"
        guard let indexOfRecord = history.journal.firstIndex(where: {$0 === record}) else { return  }
        history.journal[indexOfRecord].word1 = word1
        history.journal[indexOfRecord].word2 = word2
        let result = Record(word1: history.journal[indexOfRecord].word1, word2: history.journal[indexOfRecord].word2).word1
        
        XCTAssertEqual(result, "records", "Words in this records didn`t change")
    }
    
    func testSetSomeCardTitle() throws {
        
        var someCardTitle = ""
        let currentIndexOfCard = 0
        someCardTitle =  history.journal[currentIndexOfCard].word1
        let result  = someCardTitle
        XCTAssertEqual(result, "bananapapa", "wrong")
    }
    
    func testChangeLanguageIfIndexIsZero() throws {
        _ = 0
        AppState.shared.targetLanguage = .english
        let result = AppState.shared.targetLanguage
        XCTAssertEqual(result, .english, "wrong")
    }
    
    func testChangeLanguageIfIndexIsOne() throws {
        _ = 1
        AppState.shared.targetLanguage = .russian
        let result = AppState.shared.targetLanguage
        XCTAssertEqual(result, .russian, "wrong")
    }
    
    func testSetValueForNewGame() throws {
        let gameVM = GameViewModel()
        gameVM.game.currentIndexOfCard = 0
        gameVM.game.isCardOpen = true
        gameVM.game.records = shared.history.journal
        gameVM.game.someCardTitle = ""
        let result = gameVM.game.currentIndexOfCard
        XCTAssertEqual(result, 0, "wrong")
    }
    
    func testNextClicked() throws {
        let gameVM = GameViewModel()
        gameVM.nextClicked()
        let result = gameVM.game.currentIndexOfCard
        XCTAssertEqual(result, 1, "wrong")
    }
    
    func testPreviousClicked() throws {
        let gameVM = GameViewModel()
        gameVM.nextClicked()
        gameVM.previousClicked()
        let result = gameVM.game.currentIndexOfCard
        XCTAssertEqual(result, 0, "wrong")
    }
    
    func testButtonFlip() throws {
        let gameVM = GameViewModel()
        gameVM.nextClicked()
        gameVM.game.isCardOpen = true
        gameVM.buttonFlip()
        let result = gameVM.game.someCardTitle
        XCTAssertEqual(result, "крыса", "wrong")
    }

}
