//
//  HistoryViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

   // я хочу чтобы при вводе слова и перевода при переходе в историю, у меня отображались мои запросы
    //что мне для этого нужно? присваивать куда-то свои данные с ячеек и отображать их в истории
    //куда их присваивать? в синглтон

   
    @IBOutlet weak var tableView: UITableView!
    
    var appState = AppState.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        tableView.delegate  = self
        tableView.dataSource = self
        
        if UserDefaults.standard.value(forKey: "journal") != nil {
            appState.history.journal = UserDefaults.standard.value(forKey: "journal") as! [Record]
        }
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
