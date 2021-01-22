//
//  HistoryViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, SortPickerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    

    var chosenRecord: Record?
    
    let historyViewModel = HistoryViewModel()
    
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
        return historyViewModel.records.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: historyViewModel.constants.cellInHistory, for: indexPath) as? CellForRecord
        var cellViewModel = historyViewModel.generateCellViewModel(forIndexPath: indexPath, englishLanguageOnLeftSide: historyViewModel.switchingStateOfLanguages)
        
        cell?.VM = cellViewModel
        return cell ?? UITableViewCell()
    }
    
    //ref
    func selectSortingMethod(method: KindOfSorting) {
        sortDictionary(method: method)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            historyViewModel.appState.history.removeRecordFromHistory(record: historyViewModel.records[indexPath.row])
           // self.records = AppState.shared.getRecords()
            self.historyViewModel.records  = historyViewModel.appState.getRecords()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenRecord = historyViewModel.records[indexPath.row]
        performSegue(withIdentifier: historyViewModel.constants.identifierToDetails, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == historyViewModel.constants.identifierToDetails {
            guard let destinationVC = segue.destination as? DetailsViewController else { return }
            destinationVC.detailsViewModel = DetailsViewModel(newChosenRecord: chosenRecord!)
        }
    }
    
    @IBAction func unwindToHistory(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    func sortDictionary(method: KindOfSorting) {
        switch method {
        case .fromAtoZ: historyViewModel.records.sort(by: {$1.word1 > $0.word1})
        case .fromZtoA: historyViewModel.records.sort(by: {$1.word1 < $0.word1})
        case .earliest: historyViewModel.records.sort(by: {$1.date > $0.date})
        case .latest: historyViewModel.records.sort(by: {$1.date < $0.date})
        }
        tableView.reloadData()
    }
}

extension HistoryViewController {
    
    
    
    @objc func switchTranslationRuEn(){
        historyViewModel.switchStateOfLanguage()
        
        tableView.reloadData()
        
    }
    
    @objc func openSortMenuForWordsInHistory() {
        guard let popVC = storyboard?.instantiateViewController(identifier: historyViewModel.constants.identifierForPopover) as? PopoverViewController else { return  }
        popVC.modalPresentationStyle =  .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.barButtonItem = navigationItem.rightBarButtonItem
        popVC.preferredContentSize = CGSize(width: 350, height: 150)
        popVC.delegate = self
        self.present(popVC, animated: true)
        
    }
}
