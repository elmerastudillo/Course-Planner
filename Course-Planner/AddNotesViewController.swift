//
//  addNotesViewController.swift
//  Course-Planner
//
//  Created by Elmer Astudillo on 12/8/17.
//  Copyright © 2017 Elmer Astudillo. All rights reserved.
//

import UIKit

class AddNotesViewController: UIViewController {
    
    let stack = CoreDataStack.instance
    var session: Session?
    @IBOutlet weak var titleTF: UITextField!
    @IBOutlet weak var noteTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addNoteWasPressed(_ sender: UIButton) {
        guard let title = titleTF.text,
            let noteText = noteTF.text
            else { return }
        let note = Note(context: stack.viewContext)
        note.title = title
        note.note = noteText
        stack.save(context: stack.viewContext)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let notesVC = storyboard.instantiateViewController(withIdentifier: "NotesViewController") as? NotesViewController
        notesVC?.session = session
        if let notesViewController = notesVC
        {
            self.navigationController?.popToViewController(notesViewController, animated: true)
        }
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
