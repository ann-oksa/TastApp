//
//  HistoryViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var appState = AppState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        title = "History"
        
        
        let sortButton = UIBarButtonItem(image: UIImage(systemName: "a"), style: .plain, target: self, action: #selector(sortJournalByAlphabet))
        let settingButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(canMoveRow))
        navigationItem.rightBarButtonItems = [sortButton, settingButton ]
    }
    
    
    @objc func canMoveRow() {
        print("can move")
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    @objc func sortJournalByAlphabet() {
        print("Item clicked")
        appState.history.journal.sort(by: { $0.word1 < $1.word1 })
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appState.getRecords().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        var record = appState.getRecords()[indexPath.row]
        cell.fillConfigure(record: record)
        return cell
    }
    
    
}
