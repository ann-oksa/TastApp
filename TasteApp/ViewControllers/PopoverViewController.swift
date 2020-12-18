//
//  PopoverViewController.swift
//  TasteApp
//
//  Created by Anna Oksanichenko on 15.12.2020.
//

import UIKit

protocol SortPickerDelegate {
    
    func chozenMethodOfSorting(method: KindOfSorting)
    // метод такое то значение сортировки выбрано
    // все жэкземпляры хистори мс (коллер) заменить на делегата, который реализовывает протокол
    // фугкцтю  callerViewController.sortDictionary(by: row) тоже вызвать у делегата
    
}

class PopoverViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  
    let picker = UIPickerView()
    let arrayOfSorting = AppState.shared.sorting.arrayOfSorting
    var delegate : SortPickerDelegate?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)

        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true

        picker.delegate  = self
        picker.dataSource = self
        

    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayOfSorting.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayOfSorting[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(arrayOfSorting[row])
        print(type(of: arrayOfSorting[row]))
        delegate?.chozenMethodOfSorting(method: arrayOfSorting[row])
    }
    

}
