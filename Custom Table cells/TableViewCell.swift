//
//  TableViewCell.swift
//  Custom Table cells
//
//  Created by Manuel Mouta on 07/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    //MARK: UIOutlets
    @IBOutlet weak var _imagePhoto: UIImageView!
    @IBOutlet weak var _labelName: UILabel?
    @IBOutlet weak var _imageAvatar: UIImageView!
    @IBOutlet weak var _txtField: UITextView?

    var objectToShow : CellData? {
        didSet {
            show(object: objectToShow!)
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _txtField?.isUserInteractionEnabled = false
        _txtField?.allowsEditingTextAttributes = false
        _txtField?.isScrollEnabled = false
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    static func getNibName() -> String {
        if(true) {
            return "TableViewCell2"
        }
        else {
            return "TableViewCell"
        }
    }
    
    private func show(object:CellData) {
        _labelName?.text        = object.name
        _imagePhoto.image       = object.photo
        _imageAvatar.image      = object.avatar
        
        _txtField?.text = randomString(length: randomNumber())
        
        _imagePhoto.contentMode  = .scaleAspectFit
        _imageAvatar.contentMode = .scaleAspectFit
    }
    
    func randomNumber() -> Int{
        let randomInt = arc4random_uniform(999) + 100;
        return randomInt.hashValue
    }
    
    func randomString(length: Int) -> String {
        
        let letters : NSString  = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let len                 = UInt32(letters.length)
        var randomString        = ""
        
        for _ in 0 ..< length {
            let rand        = arc4random_uniform(len)
            var nextChar    = letters.character(at: Int(rand))
            randomString    += NSString(characters: &nextChar, length: 1) as String
        }
        
        return randomString
    }
    
}
