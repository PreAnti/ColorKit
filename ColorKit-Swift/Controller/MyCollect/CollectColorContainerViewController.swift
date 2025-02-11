//
//  ColorContainerViewController.swift
//  ColorKit-Swift
//
//  Created by Dixi-Chen on 2018/7/28.
//  Copyright © 2018年 Dixi-Chen. All rights reserved.
//

import UIKit

class CollectColorContainerViewController: BaseViewController {

    private var project:Project!
    
    private var tableVC:CollectColorDetailCollectionViewController!
    private var cardVC:CollectColorCardViewController!
    
    private var childSubView:[UIView] = []
     var currenViewIndex:Int = 0
    
    
    private var switchvcBtnItem:UIBarButtonItem!
    
    
    private var switchvcBtnItemImage:[UIImage] = [UIImage(named: "icon_card_view")!,UIImage(named: "icon_list_view")!]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.title  = NSLocalizedString("Favorites", comment: "")
        // Do any additional setup after loading the view.
        setupUI()
        
    }
    
    deinit {
        
    }

    override func viewWillLayoutSubviews() {
        updateFrame()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupUI(){
       
        tableVC = CollectColorDetailCollectionViewController()
        
        
        let sb2 = UIStoryboard(name: "CollectColorCardViewController", bundle: nil)
        cardVC = sb2.instantiateInitialViewController() as! CollectColorCardViewController
        
        view.addSubview(cardVC.view)
        
        view.addSubview(tableVC.view)
        childSubView.append(tableVC.view)
        childSubView.append(cardVC.view)
        addChild(tableVC)
        addChild(cardVC)
        
        switchvcBtnItem = UIBarButtonItem(image: UIImage(named: "icon_card_view"), style: .plain, target: self, action: #selector(switchVC))
        navigationItem.rightBarButtonItem = switchvcBtnItem
        
        
    }
    
    private func updateFrame(){
        tableVC.view.frame = self.view.bounds
        cardVC.view.frame = self.view.bounds
    }
    
    
    @objc
    func switchVC(){
        invokeNotificationFeedback(type: .success)
        
        currenViewIndex = 1-currenViewIndex
        switchvcBtnItem.image = switchvcBtnItemImage[currenViewIndex]
        view.bringSubviewToFront(childSubView[currenViewIndex])
    }
    
    override func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if(motion == UIEvent.EventSubtype.motionShake){
            
            switchVC()
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
