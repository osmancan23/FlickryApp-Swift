//
//  PostDetailViewController.swift
//  FlickrApp-Swift
//
//  Created by Osmancan Akagündüz on 26.01.2024.
//

import UIKit

class PostDetailViewController: UIViewController {

    @IBOutlet weak var detailPostDescription: UILabel!
    @IBOutlet weak var postDetailImage: UIImageView!
    @IBOutlet weak var detailUserAvatarImage: UIImageView!
    @IBOutlet weak var detailUserName: UILabel!
    var photo: Photo?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = photo?.title
        postDetailImage.backgroundColor = .gray
        detailPostDescription.text = photo?.description.content
        detailUserAvatarImage.backgroundColor = .gray
        detailUserName.text = photo?.ownername
       
               
               NetworkManager.instance.fetchImage(with: photo?.urlZ) { data in
                   DispatchQueue.main.async {
                       self.postDetailImage.image = UIImage(data: data)

                   }
               }
    }
    

    
   

}
