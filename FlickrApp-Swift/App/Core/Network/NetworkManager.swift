//
//  NetworkManager.swift
//  FlickrApp-Swift
//
//  Created by Osmancan Akagündüz on 27.01.2024.
//

import Foundation

class NetworkManager {
    
    static var instance = NetworkManager()
    
    
    func fetchPosts(completion: @escaping (PostModel) -> Void)  {
        
        
        guard  let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=2cb6d100c6e236334f52c2217ae3e2a5&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else {return}
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                print("error")
            }
            
            if let data = data , let response = try? JSONDecoder().decode(PostModel.self, from: data) {
                
                completion(response)
                
            }
            
        }.resume()
    }
    
    func searchPost(word:String , competion: @escaping (PostModel) -> Void) {
        
        
        guard  let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=2cb6d100c6e236334f52c2217ae3e2a5&text=\(word)&format=json&nojsoncallback=1&extras=description,license,date_upload,date_taken,owner_name,icon_server,original_format,last_update,geo,tags,machine_tags,o_dims,views,media,path_alias,url_sq,url_t,url_s,url_q,url_m,url_n,url_z,url_c,url_l,url_o") else {return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if error != nil {
                print(error ?? "Error")
                return
            }
            
            if let data = data , let response = try? JSONDecoder().decode(PostModel.self, from: data)  {
               
                    competion(response)

               
            }
            
        }.resume()
    }
    
    
    func fetchImage(with url: String?, completion: @escaping (Data) -> Void) {
        if let urlString = url, let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    debugPrint(error)
                    return
                }
                if let data = data {
                   
                        completion(data)
                    
                }
            }.resume()
        }
    }
    
}
