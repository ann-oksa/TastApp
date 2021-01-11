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
    
    var records : [Record]  = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        title = "History"
        self.records = appState.getRecords()
        
        let sortButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(tapped))
        navigationItem.rightBarButtonItem = sortButton
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopover" {
            let popoverVC = segue.destination
            popoverVC.popoverPresentationController?.delegate = self
        }
    }
    
    @objc func tapped() {
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
}



