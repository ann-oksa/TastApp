//
//  HistoryViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, SortPickerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var appState = AppState.shared
    var records : [Record] = AppState.shared.getRecords()
    var chosenRecord: Record?
    var switchingStateOfLanguages = true
    let constants = Constants()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        title = "History"
        
        let sortButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(openSortMenuForWordsInHistory))
        let switchTranslationButton = UIBarButtonItem(image: UIImage(systemName: "arrow.triangle.2.circlepath"), style: .plain, target: self, action: #selector(switchTranslationRuEn))
        
        navigationItem.rightBarButtonItems = [sortButton, switchTranslationButton]
        
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: constants.cellInHistory, for: indexPath) as! TableViewCell
        let record = records[indexPath.row]
        cell.fill(record: record, isEnglishLanguageOnLeftSide: switchingStateOfLanguages)
        return cell
    }
    
    func selectSortingMethod(method: KindOfSorting) {
        sortDictionary(method: method)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            appState.history.removeRecordFromHistory(record: records[indexPath.row])
            self.records = AppState.shared.getRecords()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenRecord = records[indexPath.row]
        performSegue(withIdentifier: constants.identifierToDetails, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == constants.identifierToDetails {
            guard let destinationVC = segue.destination as? DetailsViewController else { return }
            destinationVC.chosenRecord = chosenRecord
        }
    }
    
    @IBAction func unwindToHistory(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
}

extension HistoryViewController {
    
    func sortDictionary(method: KindOfSorting) {
        switch method {
        case .fromAtoZ: records.sort(by: {$1.word1 > $0.word1})
        case .fromZtoA: records.sort(by: {$1.word1 < $0.word1})
        case .earliest: records.sort(by: {$1.date > $0.date})
        case .latest: records.sort(by: {$1.date < $0.date})
        }
        tableView.reloadData()
    }
    
    @objc func switchTranslationRuEn(){
        switchingStateOfLanguages = !switchingStateOfLanguages
        tableView.reloadData()
        
    }
    
    @objc func openSortMenuForWordsInHistory() {
        guard let popVC = storyboard?.instantiateViewController(identifier: constants.identifierForPopover) as? PopoverViewController else { return  }
        popVC.modalPresentationStyle =  .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.barButtonItem = navigationItem.rightBarButtonItem
        popVC.preferredContentSize = CGSize(width: 350, height: 150)
        popVC.delegate = self
        self.present(popVC, animated: true)
        
    }
}
