//
//  PostModel.swift
//  9gagcopy
//
//  Created by Denis Istvan Varga on 2023. 08. 28..
//

import Foundation

enum PostType{
    case fresh
    case trending
    case hot
}

struct PostModel{
    let op : String
    let Title : String
    let imageLink : String
    let upVotes : Int
    let downVotes : Int
    let comments : [Comment]
    let category : PostType
}


struct Comment{
    let poster : String
    let body : String
    let upVotes : Int
    let downVotes : Int
}

struct mockPostModel{
    
    static let posts = [mockpost1,mockpost2,tpost1,tpost2,fpost1,fpost2]
    
    static let mockpost1 = PostModel(op: "originalUser",Title: "Damn boi", imageLink:"meme1" , upVotes: 954, downVotes: 59, comments:[Comment(poster: "secondUser", body: "This is a very racist site NSFW", upVotes: 489, downVotes: 30),Comment(poster: "secondUser", body: "This is a very racist site NSFW", upVotes: 489, downVotes: 30)], category: .hot)
    static let mockpost2 = PostModel(op: "secondOriginalUser", Title: "ThatsAniceMeme", imageLink: "meme2", upVotes: 453, downVotes: 20, comments: [Comment(poster: "secondUser", body: "This is a very racist site NSFW", upVotes: 489, downVotes: 30),Comment(poster: "secondUser", body: "This is a very racist site NSFW", upVotes: 489, downVotes: 30)], category: .hot)
    
    static let tpost1 = PostModel(op: "trendingposter420", Title: "This is trending now", imageLink: "trendingmeme1", upVotes: 390, downVotes: 29, comments: [Comment(poster: "trendingCommenter", body:"this is a trendingcomment on a trending post", upVotes: 34, downVotes: 2),Comment(poster: "trendingCommenter 3", body: "this is a bad meme", upVotes: 4, downVotes: 89)], category: .trending)
    static let tpost2 = PostModel(op: "xxfunnyxx", Title: "im the captain now", imageLink: "trendingmeme2", upVotes: 341, downVotes: 40, comments: [Comment(poster: "goodanimals", body: "save the bees", upVotes: 12, downVotes: 39)], category: .trending)
    
    static let  fpost1 = PostModel(op: "freshposter", Title: "postForFreshDwellers", imageLink: "freshmeme1", upVotes: 32, downVotes: 1, comments: [Comment(poster:"freshCommenter420", body: "source??", upVotes: 3, downVotes: 0)], category: .fresh)
    
    static let fpost2 = PostModel(op: "anotherFreshPoster", Title: "who needs a title?", imageLink: "freshmeme2", upVotes: 3, downVotes: 1, comments: [], category: .fresh)
}

