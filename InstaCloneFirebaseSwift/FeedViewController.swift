//
//  FeedViewController.swift
//  InstaCloneFirebaseSwift
//
//  Created by Bakyt Dzhumabaev on 6/8/21.
//

import UIKit
import Firebase

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func getDataFromFirestore() {
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Posts").addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            } else {
                
                if snapshot?.isEmpty != true && snapshot != nil {
                    for document in snapshot!.documents {
                        let documentId = document.documentID
//                        print(documentId)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            print(postedBy)
                        }
                    }
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FeedCellTableViewCell
        
        cell.emailLabel.text = "user@email.com"
        cell.likeLabel.text = "0"
        cell.commentLabel.text = "comment"
        cell.userImageView?.image = UIImage(named: "select")
        return cell
    }
    

}
