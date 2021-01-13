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
    
    
    
    var en = true
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        title = "History"
        
        let sortButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(sortWordsInHistory))
        let switchTranslationButton = UIBarButtonItem(image: UIImage(systemName: "arrow.triangle.2.circlepath"), style: .plain, target: self, action: #selector(switchTranslationRuEn))
  
        navigationItem.rightBarButtonItems = [sortButton, switchTranslationButton]

    }
    
    @objc func switchTranslationRuEn(){
        
        // менять местами колонки слов
                if en {
                    print("en true")
                    en = false
                } else {
                    print("en false")
                    en = true
                }
        
    }
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "showPopover" {
//            let popoverVC = segue.destination
//            popoverVC.popoverPresentationController?.delegate = self
//        }
//    }
    
    @objc func sortWordsInHistory() {
        guard let popVC = storyboard?.instantiateViewController(identifier: "PopoverViewController") as? PopoverViewController else { return  }
        popVC.modalPresentationStyle =  .popover
        let popOverVC = popVC.popoverPresentationController
        popOverVC?.delegate = self
        popOverVC?.barButtonItem = navigationItem.rightBarButtonItem
        popVC.preferredContentSize = CGSize(width: 350, height: 150)
        popVC.delegate = self
        self.present(popVC, animated: true)
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        var record = records[indexPath.row]
        cell.fillConfigure(record: record)
        return cell
    }
    
    func sortDictionary(method: KindOfSorting) {
        switch method {
        case .AZ: records.sort(by: {$1.word1 > $0.word1})
        case .ZA: records.sort(by: {$1.word1 < $0.word1})
        case .earliest: records.sort(by: {$1.date > $0.date})
        case .latest: records.sort(by: {$1.date < $0.date})
        }
        tableView.reloadData()
    }
    
    func chozenMethodOfSorting(method: KindOfSorting) {
        sortDictionary(method: method)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            appState.history.removeRecordFromHistory(rec: records[indexPath.row])
            self.records = AppState.shared.getRecords()
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenRecord = records[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.chosenRecord = chosenRecord
        }
}
    
    @IBAction func unwindToHistory(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
   
    


}
