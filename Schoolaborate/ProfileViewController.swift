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
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    
let user = PFUser()
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Username label is set to the current users username
        usernameLabel.text = PFUser.current()?.username
        
        
        //School label is set to current users school
        schoolnameLabel.text = PFUser.current()!["school"] as? String
        

        //Profile picture is set to users chosen picture
       
        //
        
        
        //First name and last name
        FirstNameLabel.text = PFUser.current()!["firstName"] as? String
        LastNameLabel.text = PFUser.current()!["lastName"] as? String
        
        
        
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
