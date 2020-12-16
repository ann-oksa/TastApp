//
//  HistoryViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var appState = AppState.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        title = "History"
      
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
        popVC.callerViewController = self
        self.present(popVC, animated: true)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
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
