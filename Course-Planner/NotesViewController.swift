//
//  NotesViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var notesTableView: UITableView!
    var session : Session?
    let dataSource = TableViewDataSource(items: [Note]())

    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let notes = session?.note?.allObjects as? [Note] else { return }
        print(notes)
        dataSource.items = notes
        notesTableView.dataSource = dataSource
        dataSource.configureCell = { (tableView, indexpath) -> UITableViewCell in
            let note = notes[indexpath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell")
            cell?.textLabel?.text = note.title
            return cell!
        }
        
        self.notesTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNotesButtonPressed(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let addNotesVC = storyboard.instantiateViewController(withIdentifier: "AddNotesViewController") as! AddNotesViewController
        addNotesVC.session = self.session
        self.navigationController?.pushViewController(addNotesVC, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
