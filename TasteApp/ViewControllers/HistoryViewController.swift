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
      //  setupGesture()
        
//        let sortButton = UIBarButtonItem(image: UIImage(systemName: "a"), style: .plain, target: self, action: #selector(sortJournalByAlphabet))
//        let settingButton = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(canMoveRow))
//        navigationItem.rightBarButtonItems = [sortButton, settingButton ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopover" {
            let popoverVC = segue.destination
            popoverVC.popoverPresentationController?.delegate = self
        }
    }


    
//    private func setupGesture() {
//        let tapGesture = UIGestureRecognizer(target: navigationItem.rightBarButtonItem, action: #selector(tapped))
//      //  tapGesture.numberOfTouches
//
//    }
//
//
//    @objc func tapped() {
//        guard let popVC = storyboard?.instantiateViewController(identifier: "popVC") else { return  }
//        popVC.modalPresentationStyle =  .popover
//        let popOverVC = popVC.popoverPresentationController
//        popOverVC?.delegate = self
//        popOverVC?.sourceView = navigationItem.rightBarButtonItem
//      //  popOverVC?.sourceRect = CGRect(x: self.navigationItem.rightBarButtonItem.bounds, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
//        popVC.preferredContentSize = CGSize(width: 250, height: 250)
//        self.present(popVC, animated: true)
//    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
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
