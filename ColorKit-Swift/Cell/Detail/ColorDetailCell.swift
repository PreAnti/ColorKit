//
//  ColorDetailCell.swift
//  ColorKit-Swift
//
//  Created by Dixi-Chen on 2018/5/13.
//  Copyright © 2018年 Dixi-Chen. All rights reserved.
//

import UIKit

class ColorDetailCell: UITableViewCell {

    @IBOutlet weak var hexColorLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func setBackgroundColor( color:UIColor) {
        backgroundColor = color;
        var red: CGFloat = 0;
        var green:CGFloat = 0;
        var blue:CGFloat = 0;
        var alpha: CGFloat = 0;
        color.getRed(&red, green: &green, blue: &blue, alpha:&alpha)
        let average = (red+green+blue)/3.0
        hexColorLabel.textColor = average>0.5 ? UIColor.black : UIColor.white
    }
    
    public func setColorInfo(color:Color){
        let red32 = color.value(forKey: "r") as! Int32
        let green32 = color.value(forKey: "g") as! Int32
        let blue32 = color.value(forKey: "b") as! Int32
        let name = color.value(forKey: "name") as? String
        let r :CGFloat = CGFloat(red32)/255.0
        
        let g :CGFloat = CGFloat(green32)/255.0
        let b :CGFloat = CGFloat(blue32)/255.0
        
        let average = (r+g+b)/3.0
        hexColorLabel.textColor = average>0.5 ? UIColor.black : UIColor.white
        backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1.0)
        titleLabel.text = name
        titleLabel.textColor = average>0.5 ? UIColor.black : UIColor.white
    }
}
