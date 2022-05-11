//
//  GeneralViewController.swift
//  Schoolaborate
//
//  Created by Anthony Narvaez on 5/5/22.
//

import UIKit
import Parse
import AlamofireImage


class GeneralViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts = [PFObject]()
        
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className: "Posts")
        query.includeKey("author")
        query.whereKey("audience", equalTo: PFUser.current()!["school"] as? String );

        query.limit = 20
        
        query.findObjectsInBackground { (posts, error) in
            if posts != nil {
                self.posts = posts!
                self.tableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GeneralTableViewCell") as! GeneralTableViewCell
        let post = posts[indexPath.row]
        
        //let user = post["Author"] as! PFUser
        cell.captionLabel.text = post["caption"] as! String
        cell.typeLabel.text = post["kind"] as? String
        cell.programnameLabel.text = post["program_name"] as? String
        
        
        let imageFile = post["image"] as! PFFileObject
        let urlString = imageFile.url!
        let url = URL(string:urlString)!
        
        cell.photoView.af_setImage(withURL: url)
        
        return cell
        

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

   






//query.whereKey("audience", equalTo: PFUser.current()!["school"] as? String );
