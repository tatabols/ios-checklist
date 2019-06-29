//
//  AddItemTableViewController.swift
//  Checklist
//
//  Created by Charles Borabien on 28/6/19.
//  Copyright © 2019 Charles Borabien. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate: class {
    
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishedAdding item: CheckListItem)
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishedEditing item: CheckListItem)
    
}

class ItemDetailViewController: UITableViewController {

    weak var delegate: ItemDetailViewControllerDelegate?
    weak var todoList: TodoList?
    weak var itemToEdit: CheckListItem?
    
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textfield.text = item.text
            addBarButton.isEnabled = true
        }
        
        navigationItem.largeTitleDisplayMode = .never
    }

    @IBAction func cancel(_ sender: Any) {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    
    @IBAction func add(_ sender: Any) {
        if let item = itemToEdit, let text = textfield.text {
            item.text = text
            delegate?.itemDetailViewController(self, didFinishedEditing: item)
        } else {
            if let item = todoList?.newTodo() {
                if let textfield = textfield.text {
                    item.text = textfield
                }
                item.checked = false
                delegate?.itemDetailViewController(self, didFinishedAdding: item)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textfield.becomeFirstResponder()
    }

}

extension ItemDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfield.resignFirstResponder()
        
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textfield.text,
              let stringRange = Range(range, in: oldText) else {
            return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButton.isEnabled = false
        } else {
            addBarButton.isEnabled = true
        }
        return true
    }
}
