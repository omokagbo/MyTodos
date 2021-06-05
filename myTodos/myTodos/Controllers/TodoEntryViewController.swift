//
//  TodoEntryViewController.swift
//  myTodos
//
//  Created by omokagbo on 24/05/2021.
//

import UIKit
import RealmSwift

class TodoEntryViewController: UIViewController {
  
  private let persistenceService = RealmPersistenceService()
  
  @IBOutlet var titleField: UITextField!
  @IBOutlet var detailField: UITextView!
  var completion: (() -> Void)?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    titleField.becomeFirstResponder()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                        style: .done,
                                                        target: self,
                                                        action: #selector(didTapSaveButton))
  }
  
  @objc func didTapSaveButton() {
    
    if let text = titleField.text, !text.isEmpty, !detailField.text.isEmpty {
      persistenceService.saveData(title: text, detail: detailField.text)
      completion?()
      self.navigationController?.popToRootViewController(animated: true)
    } else {
      let alert = UIAlertController(title: "Empty Todo", message: "Please fill in the fields", preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      self.present(alert, animated: true, completion: nil)
    }
  }
  
}
