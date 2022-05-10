//
//  PostViewController.swift
//  Schoolaborate
//
//  Created by Anthony Narvaez on 5/7/22.
//

import UIKit
import Parse
import AlamofireImage
import UIKit

class PostViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate, UITextFieldDelegate {
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
    }


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var captionField: UITextField!
    @IBOutlet weak var postkindField: UITextField!
    @IBOutlet weak var programnameField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        captionField.delegate = self //delegate for return key dismiss of keyboard
    }
    //Create post audience string
    var postAudience = " "
    
    @IBAction func schoolannouncementSwitch(_ sender: UISwitch) {
        if (sender.isOn == true)
        {
            print("School announcement is on")
            postAudience = PFUser.current()!["school"] as! String
print("School announcement is set to: ", postAudience)
        }
        else
        {
            print("School announcement is off")
        }
    }
    @IBAction func onSubmitButton(_ sender: Any) {
        let post = PFObject(className: "Posts")
        
        post["caption"] = captionField.text
        post["Author"] = PFUser.current()!
        post["audience"] = postAudience
        post["kind"] = postkindField.text
        post["program_name"] = programnameField.text
        
        let imageData = imageView.image!.pngData()
        let file = PFFileObject(name: "image.png", data: imageData!)
        
        post["image"] = file
        
        post.saveInBackground { success, error in
            if success{
                print("saved!")
            }
                else{
                    print("error!")
                }
            }
        
        self.performSegue(withIdentifier: "homeSegue", sender: self)
        
        }
    
    @IBAction func onCameraButton(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
        } else {
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        
        imageView.image = scaledImage
        
        dismiss(animated: true, completion: nil)
    }
    
    // Dismiss keyboard on whitespace tapped
    @IBAction func onViewTapped(_ sender: Any) {
        let tapGesture = UITapGestureRecognizer(target: self,
                                                action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        
        
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

// Extension to dismiss keyboard on RETURN KEY
extension PostViewController {
    func textFieldShouldReturn(_ captionField: UITextField) -> Bool {
          captionField.resignFirstResponder() // dismiss keyboard
          return true
      }
}
