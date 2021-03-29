//
//  Data.swift
//  DesignCode
//
//  Created by PH on 2021/3/29.
//

import SwiftUI

struct Post: Codable, Identifiable {
  var id = 1
  var title: String
  var body: String
}

class Api {
  func getPosts(completion: @escaping ([Post]) -> ()) {
    let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
    
    URLSession.shared.dataTask(with: url!) { (data, _, _) in
      let posts = try! JSONDecoder().decode([Post].self, from: data!)
      print(posts)
      DispatchQueue.main.async {
        completion(posts)
      }
    }
    .resume()
  }
}
