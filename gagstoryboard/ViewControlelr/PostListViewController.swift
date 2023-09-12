//
//  PostListViewController.swift
//  gagstoryboard
//
//  Created by Denis Istvan Varga on 2023. 08. 28..
//

import Foundation
import UIKit

class PostListViewController:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBAction func topTapBar(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: postTableView.reloadData()
        case 1: postTableView.reloadData()
        case 2: postTableView.reloadData()
        default:
            break
        }
        
    }
    @IBOutlet var topSegmentedControl: UISegmentedControl!
    @IBOutlet var postTableView: UITableView!
    
    let vm = PostListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "9GAG"
        postTableView.register(PostTableViewCell.nib(), forCellReuseIdentifier: PostTableViewCell.identifier)
        postTableView.dataSource = self
        postTableView.delegate = self
        
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumberOfCells()
    }
    
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        goToDetailsPageFor(indexPath: indexPath)
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = tableView.dequeueReusableCell(withIdentifier:PostTableViewCell.identifier,for: indexPath) as! PostTableViewCell
        switch topSegmentedControl.selectedSegmentIndex {
        case 0:
            return createCustomCell(post: getHotPosts()[indexPath.row], cell: customCell)
        case 1:
            return createCustomCell(post: getTrendingPosts()[indexPath.row], cell: customCell)
        case 2:
            return createCustomCell(post: getFreshPosts()[indexPath.row], cell: customCell)
        default:
            return createCustomCell(post: self.vm.posts.filter {$0.category == .hot}[indexPath.row], cell: customCell)
        }
    }
}

    extension PostListViewController{
        
    private func createCustomCell (post : PostModel, cell : PostTableViewCell) -> PostTableViewCell{
        cell.configure(title: post.Title, imageString: post.imageLink, postPoster: post.op, upVoteCount: post.upVotes, downVoteCount: post.downVotes)
        return cell
    }
    
    private func goToDetailsPageFor(indexPath : IndexPath){
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailStoryboard") as? PostDetailViewController{
            switch topSegmentedControl.selectedSegmentIndex {
            case 0:
                vc.post = getHotPosts() [indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                vc.post = getTrendingPosts() [indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                vc.post = getFreshPosts() [indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
    }
   private func getNumberOfCells()->Int{
        switch topSegmentedControl.selectedSegmentIndex {
        case 0:
            return getHotPosts().count
        case 1:
            return getTrendingPosts().count
        case 2:
            return getFreshPosts().count
        default:
            return 0
        }
    }
    
    private func getHotPosts() -> [PostModel]{
        return vm.posts.filter {$0.category == .hot}
    }
    
    private func getTrendingPosts() -> [PostModel]{
        return vm.posts.filter {$0.category == .trending}
    }
    
    private func getFreshPosts() -> [PostModel]{
        return vm.posts.filter {$0.category == .fresh}
    }
    
}
