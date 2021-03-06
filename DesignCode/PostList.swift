//
//  PostList.swift
//  DesignCode
//
//  Created by PH on 2021/3/29.
//

import SwiftUI

struct PostList: View {
  @State var posts: [Post] = []
  
  var body: some View {
    List(posts) { post in
      Text(post.title)
    }
    .onAppear {
      Api().getPosts { posts in
        self.posts = posts
      }
    }
  }
}

struct PostList_Previews: PreviewProvider {
  static var previews: some View {
    PostList()
  }
}
