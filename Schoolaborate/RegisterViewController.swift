//
//  RegisterViewController.swift
//  Schoolaborate
//
//  Created by Kiki Yem on 4/23/22.
//

import UIKit
import Parse

class RegisterViewController: UIViewController {

    
    @IBOutlet weak var firstnameField: UITextField!
    @IBOutlet weak var lastnameField: UITextField!
    @IBOutlet weak var schoolField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func onRegister(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user["school"] = schoolField.text
        user["firstName"] = firstnameField.text
        user["lastName"] = lastnameField.text

        
        user.signUpInBackground { (success, error) in
            if success{
                self.performSegue(withIdentifier: "registerSegue", sender: nil)
            }
            else{
                print("Error: \(error?.localizedDescription)")
            }
        
        }
        
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
