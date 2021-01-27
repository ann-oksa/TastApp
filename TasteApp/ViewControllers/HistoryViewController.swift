//
//  HistoryViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 02.12.2020.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPopoverPresentationControllerDelegate, SortPickerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    let historyViewModel = HistoryViewModel(records: AppState.shared.getRecords())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate  = self
        tableView.dataSource = self
        title = "History"
        tableView.reloadData()
        let sortButton = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(openSortMenuForWordsInHistory))
        let switchTranslationButton = UIBarButtonItem(image: UIImage(systemName: "arrow.triangle.2.circlepath"), style: .plain, target: self, action: #selector(switchTranslationRuEn))
        
        navigationItem.rightBarButtonItems = [sortButton, switchTranslationButton]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        for record in historyViewModel.listOfCellViewModel {
            record.configure(isEnglishLanguageOnLeftSide: true)
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyViewModel.listOfCellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: historyViewModel.constants.cellInHistory, for: indexPath) as? CellForRecord
        let cellViewModel = historyViewModel.listOfCellViewModel[indexPath.row]
        cell?.bind(cellViewModel)
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            historyViewModel.removeChosenRecord(indexPath: indexPath)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        historyViewModel.selectRowToGo(indexPath: indexPath)
        performSegue(withIdentifier: historyViewModel.constants.identifierToDetails, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == historyViewModel.constants.identifierToDetails {
            guard let destinationVC = segue.destination as? DetailsViewController else { return }
            destinationVC.detailsViewModel = DetailsViewModel(newChosenRecord: historyViewModel.chosenRecord!)
        }
    }
    
    @IBAction func unwindToHistory(segue: UIStoryboardSegue) {
        tableView.reloadData()
    }
    
    func selectSortingMethod(method: KindOfSorting) {
        historyViewModel.sortDictionary(method: method)
        tableView.reloadData()
    }
    
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
