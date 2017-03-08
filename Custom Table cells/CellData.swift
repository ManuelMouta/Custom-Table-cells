//
//  dummyData.swift
//  Custom Table cells
//
//  Created by Manuel Mouta on 07/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import Foundation
import UIKit

struct CellData{
    
    let name     : String
    let photo    : UIImage
    let avatar   : UIImage
    
    static var cellDataArray:[CellData] = [CellData]()
    
    init(name:String,photo:UIImage,avatar:UIImage){
        self.name    = name
        self.photo   = photo
        self.avatar  = avatar
    }
    
    static func createTableData(){
        //Image Literal is nice to use
        CellData.cellDataArray.append(CellData(name: "Manuel Mouta",photo: #imageLiteral(resourceName: "images"),avatar: #imageLiteral(resourceName: "android")))
        CellData.cellDataArray.append(CellData(name: "User x",photo: #imageLiteral(resourceName: "user1"),avatar: #imageLiteral(resourceName: "default_1")))
        CellData.cellDataArray.append(CellData(name: "User y",photo: #imageLiteral(resourceName: "user1"),avatar: #imageLiteral(resourceName: "default_1")))
        CellData.cellDataArray.append(CellData(name: "User z",photo: #imageLiteral(resourceName: "user1"),avatar: #imageLiteral(resourceName: "default_1")))
        
    }
}
