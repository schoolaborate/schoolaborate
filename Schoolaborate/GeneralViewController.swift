//
//  GeneralViewController.swift
//  Schoolaborate
//
//  Created by Anthony Narvaez on 5/5/22.
//

import UIKit
import Parse

class GeneralViewController: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let query = PFQuery(className: "Post")
        //Find objects where the title is equal to user's school
        query.whereKey("audience", equalTo: PFUser.current()!["school"] as? String );
        
        
        // Do any additional setup after loading the view.
        
    
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
