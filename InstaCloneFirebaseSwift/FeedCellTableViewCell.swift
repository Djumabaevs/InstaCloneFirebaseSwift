//
//  FeedCellTableViewCell.swift
//  InstaCloneFirebaseSwift
//
//  Created by Bakyt Dzhumabaev on 13/8/21.
//

import UIKit
import Firebase

class FeedCellTableViewCell: UITableViewCell {

    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var documentId: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButton(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!) {
            
            let likeStore = ["likes" : likeCount] as [String: Any]
            
            firestoreDatabase
                .collection("Posts")
                .document(documentId.text!)
                .setData(likeStore, merge: true)
        }
    }
}
