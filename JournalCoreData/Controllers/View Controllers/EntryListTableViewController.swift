//
//  EntryListTableViewController.swift
//  JournalCoreData
//
//  Created by anthony byrd on 4/26/21.
//

import UIKit

class EntryListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        EntryController.sharedInstance.fetchEntries()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    //MARK: - Action
    var entry: EntryController?

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EntryController.sharedInstance.entries.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)

        let entry = EntryController.sharedInstance.entries[indexPath.row]
        cell.textLabel?.text = entry.title
        
        return cell
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            guard let entry = entry else {return}
            let entryToDelete = entry.entries[indexPath.row]
            EntryController.sharedInstance.deleteEntry(with: entryToDelete)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cellToEntryDetailVC" {
            guard let destinationVC = segue.destination as? EntryDetailViewController,
                  let indexPath = tableView.indexPathForSelectedRow else {return}
            let entry = EntryController.sharedInstance.entries[indexPath.row]
            destinationVC.entry = entry
        }
    }

}//End of class
