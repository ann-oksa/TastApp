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

    var info = Information.shared
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        tableView.delegate  = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.wordLabel.text = info.word
        cell.translationLabel.text = info.translation
        return cell
    }
    

}
