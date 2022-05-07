//
//  ProfileViewController.swift
//  Schoolaborate
//
//  Created by Anthony Narvaez on 5/6/22.
//

import UIKit
import Parse

class ProfileViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var schoolnameLabel: UILabel!
    @IBOutlet weak var profileimageView: UIImageView!
    
let user = PFUser()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Username label is set to the current users username
        usernameLabel.text = PFUser.current()?.username
        
        
        //School label is set to current users school
        schoolnameLabel.text = PFUser.current()!["school"] as! String
        

        //Profile picture is set to users chosen picture
        //to be added
        
        
        
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
