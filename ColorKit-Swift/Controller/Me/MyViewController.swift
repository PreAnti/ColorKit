//
//  MyViewController.swift
//  ColorKit-Swift
//
//  Created by Dixi-Chen on 2018/8/6.
//  Copyright © 2018年 Dixi-Chen. All rights reserved.
//

import UIKit
import SafariServices
class MyViewController: UITableViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        tableView.tableFooterView = UIView(frame: footerFrame1)
        tableView.backgroundColor = UIColor.CommonViewBackgroundColor()
        tableView.separatorStyle = .none
        navigationItem.title = NSLocalizedString("Mine", comment: "")
 
        let vc = FeaturedCollectionViewController()
        navigationController?.pushViewController(vc, animated: false)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    private enum Section: Int {
        case General
        case Developer
        case Another
        
    }
    
    private enum GeneralRow: Int {
        case Collect
        case Guide
        
    }
    
    private enum DeveloperRow: Int {
        case Weibo
    }
    
    private enum AnotherRow: Int{
        case Review
        case Share
        case About
        case Privacy
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer{
            tableView.deselectRow(at: indexPath, animated: false)
        }
        guard let section = Section(rawValue: indexPath.section) else {
            fatalError()
        }
        
        switch section{
        case .General:
            
            guard let row = GeneralRow(rawValue: indexPath.row) else {
                return
            }
            
            switch row {
            case .Collect:
                //弹出精选界面
                let vc = FeaturedCollectionViewController()
                navigationController?.pushViewController(vc, animated: true)
            case .Guide:
                //跳转操作指导界面
                break
           
            }
        case .Developer:
            guard let row = DeveloperRow(rawValue: indexPath.row) else {
                return

            }
            switch row{
            case .Weibo:
                //跳转我的微博
                jumpToWeiboHomepage()

            }
        case .Another:
            guard let row = AnotherRow(rawValue: indexPath.row) else {
               return
            }
            
            switch row {
                
            case .Review:
                //弹出评论
                jumpToComment()
                
            case .Share:
                //分享app
                let cell = tableView.cellForRow(at: indexPath)
                
                shareMyApp(sourceView: cell)
            case .About:
                //弹出关于界面
                jumpToAbount()
            case .Privacy:
                jumpToPrivacy()
            }
        }
    }

    func jumpToComment(){
        let strLoc = "https://itunes.apple.com/us/app/twitter/id1422973826?mt=8&action=write-review";
        if let url = URL(string: strLoc){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
    
    func jumpToWeiboHomepage(){
        let weiboLoc = "sinaweibo://userinfo?uid=2626263585"
        if let url = URL(string: weiboLoc){
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }else{
                if let url = URL(string: "https://www.weibo.com/2626263585/profile?rightmod=1&wvr=6&mod=personinfo"){
                    let vc = SFSafariViewController(url: url)
                    self.present(vc, animated: true, completion: nil)
                }
            }
        }
    }
    
    func shareMyApp(sourceView:UIView?){
        invokeSelectionFeedback()
        let text = NSLocalizedString("ColorNote", comment: "")
        let image = UIImage(named: "App_Icon")
        let url = URL(string: "https://itunes.apple.com/app/id1422973826")
        let items = [text,image ?? "nil",url ?? "nil"] as [Any]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        activityVC.completionWithItemsHandler = {
            activity, success, items, error in
        }
        activityVC.popoverPresentationController?.sourceView = sourceView
        activityVC.popoverPresentationController?.sourceRect = CGRect.zero
        present(activityVC, animated: true, completion: nil)
    }

    func jumpToAbount(){
        let sb = UIStoryboard(name: "AboutViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController() as! AboutViewController
        vc.navigationItem.title = NSLocalizedString("AboutColourNote", comment: "")
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func jumpToPrivacy(){
        if let url = URL(string: "https://www.freeprivacypolicy.com/privacy/view/17122df332a609563877d7cff2496229"){
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true, completion: nil)
        }
    }
    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
