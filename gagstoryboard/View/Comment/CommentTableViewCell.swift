//
//  CommentTableViewCell.swift
//  gagstoryboard
//
//  Created by Denis Istvan Varga on 2023. 08. 29..
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    static func nib() ->UINib{
        return UINib(nibName: "CommentTableViewCell", bundle: nil)
    }
    @IBAction func upVoteButtonPressed(_ sender: UIButton) {
        
        switch voteStatus{
        case 0:
                sender.tintColor=UIColor.red
                commentUpvotes.text=String(Int(commentUpvotes.text!)!+1)
                voteStatus = 1
                downVoteButton.tintColor=UIColor.systemBlue
            
        case 1:
                sender.tintColor=UIColor.systemBlue
                commentUpvotes.text=String(Int(commentUpvotes.text!)!-1)
                voteStatus = 0
        case -1:
            sender.tintColor=UIColor.red
            commentUpvotes.text=String(Int(commentUpvotes.text!)!+2)
            voteStatus = 1
            downVoteButton.tintColor=UIColor.systemBlue
        default:
            return
        }
    }
    
    @IBAction func downVoteButtonPressed(_ sender: UIButton) {
        
        switch voteStatus{
        case -1:
            sender.tintColor=UIColor.systemBlue
            commentUpvotes.text=String(Int(commentUpvotes.text!)!+1)
            voteStatus = 0
        case 0:
            sender.tintColor=UIColor.red
                commentUpvotes.text=String(Int(commentUpvotes.text!)!-1)
                voteStatus = -1
                upVoteButton.tintColor=UIColor.systemBlue
        case 1:
            sender.tintColor=UIColor.red
                commentUpvotes.text=String(Int(commentUpvotes.text!)!-2)
                voteStatus = -1
                upVoteButton.tintColor=UIColor.systemBlue
        default:
            return
        }
    }
    
    @IBOutlet var commentBody: UILabel!
    @IBOutlet var commentUpvotes: UILabel!
    @IBOutlet var upVoteButton: UIButton!
    @IBOutlet var downVoteButton: UIButton!
    @IBOutlet var commenterName: UILabel!
    private var voteStatus = 0
    private var downVoteCount = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    public func configure(commenterName : String,commentBody : String, upVoteCount:Int,downVoteCount:Int){
        self.commenterName.text=commenterName
        self.commentBody.text = commentBody
        self.commentUpvotes.text = String(upVoteCount-downVoteCount)
        self.downVoteCount = downVoteCount
    }
}
