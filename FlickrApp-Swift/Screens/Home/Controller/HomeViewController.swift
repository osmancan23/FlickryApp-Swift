//
//  ViewController.swift
//  FlickrApp-Swift
//
//  Created by Osmancan Akagündüz on 26.01.2024.
//

import UIKit

class HomeViewController: UITableViewController, UISearchResultsUpdating {
    
    var selectedPhoto : Photo?
    
    var postModel : PostModel? {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupSearchController()
        fetchPosts()
        
    }
    
    func setupSearchController()  {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
    }

    
    func fetchPosts()  {
        NetworkManager.instance.fetchPosts{ postModel in
            DispatchQueue.main.async {
                self.postModel = postModel
                print(postModel.photos.photo.count)
            }
        }
    }
    
    func fetchSearchPosts(word:String)  {
        print("Gelen Word : \(word)")
        NetworkManager.instance.searchPost(word: word){ postModel in
            DispatchQueue.main.async {
                self.postModel = postModel
                print(postModel.photos.photo.count)
            }
        }
    }


    func updateSearchResults(for searchController: UISearchController) {
        guard let search = searchController.searchBar.text else {return}
        
        if search.count > 2 {
            print(search)
            fetchSearchPosts(word: search)
        }
    }
    
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postModel?.photos.photo.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = postModel?.photos.photo[indexPath.row]
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath) as! PostTableViewCell
        cell.avatarImage.backgroundColor = .red
        cell.postImage.backgroundColor = .gray
        cell.userNameLabel.text = post?.ownername
        cell.postTitleLabel.text = post?.title
        
       
        
        NetworkManager.instance.fetchImage(with: post?.urlN) { data in
            DispatchQueue.main.async {
                cell.postImage.image = UIImage(data: data)
            }
         }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedPhoto = postModel?.photos.photo[indexPath.row]
        performSegue(withIdentifier: "navigateDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? PostDetailViewController {
            viewController.photo = selectedPhoto
        }
    }

}

