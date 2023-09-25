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
            return createCustomCell(post: getPosts(postType: .hot)[indexPath.row], cell: customCell)
        case 1:
            return createCustomCell(post: getPosts(postType: .trending)[indexPath.row], cell: customCell)
        case 2:
            return createCustomCell(post: getPosts(postType: .fresh)[indexPath.row], cell: customCell)
        default:
            return createCustomCell(post: self.vm.posts.filter {$0.category == .hot}[indexPath.row], cell: customCell)
        }
    }
}

extension PostListViewController {
    
    private func createCustomCell(post : PostModel, cell : PostTableViewCell) -> PostTableViewCell {
        cell.configure(title: post.Title, imageString: post.imageLink, postPoster: post.op, upVoteCount: post.upVotes, downVoteCount: post.downVotes)
        return cell
    }
    
    private func goToDetailsPageFor(indexPath : IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "PostDetailStoryboard") as? PostDetailViewController{
            switch topSegmentedControl.selectedSegmentIndex {
            case 0:
                vc.post = getPosts(postType: .fresh) [indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            case 1:
                vc.post = getPosts(postType: .trending) [indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            case 2:
                vc.post = getPosts(postType: .fresh) [indexPath.row]
                self.navigationController?.pushViewController(vc, animated: true)
            default:
                break
            }
        }
    }
    private func getNumberOfCells()->Int {
        switch topSegmentedControl.selectedSegmentIndex {
        case 0:
            return getPosts(postType:.hot).count
        case 1:
            return getPosts(postType: .trending).count
        case 2:
            return getPosts(postType: .fresh).count
        default:
            return 0
        }
    }
    
    private func getPosts(postType : PostType) -> [PostModel] {
        switch postType {
        case .hot:
            return vm.posts.filter {$0.category == .hot}
        case .trending:
            return vm.posts.filter {$0.category == .trending}
        case .fresh:
            return vm.posts.filter {$0.category == .fresh}
        default:
            break
        }
        
        
        
    }
    
}
