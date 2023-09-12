//
//  PostTableViewCell.swift
//  gagstoryboard
//
//  Created by Denis Istvan Varga on 2023. 08. 28..
//

import UIKit

class PostTableViewCell: UITableViewCell {


    @IBOutlet var postImageView : UIImageView!
    @IBOutlet var postTitle : UILabel!
    @IBOutlet var postPoster: UILabel!
    @IBOutlet var upVoteCount : UILabel!
    @IBOutlet var upArrow : UIButton!
    @IBOutlet var downArrow : UIButton!
    var voteStatus = 0
    var downVoteCount = 0
    static let identifier = "PostTableViewCell"
    
    static func nib() ->UINib{
        return UINib(nibName: "PostTableViewCell", bundle: nil)
    }
    @IBAction func UpArrowTap(_ sender: UIButton) {
        upArrowPressed(sender: sender)
    }
    @IBAction func DownArrowTap(_ sender: UIButton) {
        downArrowPressed(sender: sender)
    }
    
    public func configure(title : String,imageString : String,postPoster : String,upVoteCount:Int,downVoteCount:Int){
        postTitle.text=title
        postImageView.image = UIImage(named: imageString)
        self.postPoster.text = postPoster
        self.upVoteCount.text = String(upVoteCount-downVoteCount)
        self.downVoteCount = downVoteCount
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func upArrowPressed(sender : UIButton){
        switch voteStatus{
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
    
    func downArrowPressed(sender : UIButton){
        switch voteStatus{
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
}
