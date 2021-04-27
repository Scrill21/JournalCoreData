//
//  EntryDetailViewController.swift
//  JournalCoreData
//
//  Created by anthony byrd on 4/26/21.
//

import UIKit

class EntryDetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    //MARK: - Properties
    var entry: Entry?
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text, !title.isEmpty,
              let body = bodyTextField.text, !body.isEmpty else {return}
        
        if let entry = entry {
            entry.title = title
            entry.bodyText = body
            EntryController.sharedInstance.updateEntry(entry)
        } else {
            EntryController.sharedInstance.createEntry(title: title, body: body)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func clearButtonTapped(_ sender: Any) {
        titleTextField.text = ""
        bodyTextField.text = ""
    }
    
    //MARK: - Helper Methods
    func updateViews() {
        guard let entry = entry else {return}
        titleTextField.text = entry.title
        bodyTextField.text = entry.bodyText
    }

}//End of class
