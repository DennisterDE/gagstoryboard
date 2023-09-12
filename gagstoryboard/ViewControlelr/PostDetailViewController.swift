//
//  PostDetailViewController.swift
//  gagstoryboard
//
//  Created by Denis Istvan Varga on 2023. 08. 29..
//

import UIKit

class PostDetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    
    
    @IBAction func upArrowPressed(_ sender: UIButton) {
        switch voteStatus
        {
        case 0:
            
            sender.tintColor=UIColor.red
            upVoteCount.text=String(Int(upVoteCount.text!)!+1)
            voteStatus = 1
            downArrow.tintColor=UIColor.systemBlue
            
        case 1:
            
            sender.tintColor=UIColor.systemBlue
            upVoteCount.text=String(Int(upVoteCount.text!)!-1)
            voteStatus = 0
        case -1:
            
            sender.tintColor=UIColor.red
            upVoteCount.text=String(Int(upVoteCount.text!)!+2)
            voteStatus = 1
            downArrow.tintColor=UIColor.systemBlue
            
        default:
            return
        }
    }
    @IBAction func downArrowPressed(_ sender: UIButton) {
        switch voteStatus
        {
        case -1:
            sender.tintColor=UIColor.systemBlue
            upVoteCount.text=String(Int(upVoteCount.text!)!+1)
            voteStatus = 0
        case 0:
            sender.tintColor=UIColor.red
            upVoteCount.text=String(Int(upVoteCount.text!)!-1)
            voteStatus = -1
            upArrow.tintColor=UIColor.systemBlue
        case 1:
            sender.tintColor=UIColor.red
            upVoteCount.text=String(Int(upVoteCount.text!)!-2)
            voteStatus = -1
            upArrow.tintColor=UIColor.systemBlue
            
        default:
            return
        }
    }
    @IBAction func commentButtonPressed(_ sender: Any) {
    }
    
    @IBOutlet var downArrow: UIButton!
    @IBOutlet var op: UILabel!
    @IBOutlet var upVoteCount: UILabel!
    @IBOutlet var upArrow: UIButton!
    @IBOutlet var posterName: UILabel!
    @IBOutlet var postImageView: UIImageView!
    @IBOutlet var commentTableView: UITableView!
    var post = mockPostModel.posts[0]
    var voteStatus = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        commentTableView.register(CommentTableViewCell.nib(), forCellReuseIdentifier: "CommentTableViewCell")
        commentTableView.dataSource=self
        commentTableView.delegate=self
        
        op.text=post.Title
        posterName.text=post.op
        postImageView.image=UIImage(named: post.imageLink)
        upVoteCount.text=String(Int(post.upVotes-post.downVotes))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return post.comments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier:"CommentTableViewCell",for: indexPath) as! CommentTableViewCell
        
        return createCustomCell(comment: self.post.comments[indexPath.row], cell: customCell)
    }
    
    func createCustomCell (comment : Comment, cell : CommentTableViewCell) -> CommentTableViewCell{
        cell.configure(commenterName:comment.poster , commentBody: comment.body, upVoteCount: comment.upVotes, downVoteCount: comment.downVotes)
        return cell
    }
    
}
