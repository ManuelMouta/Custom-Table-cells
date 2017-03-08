//
//  ViewController.swift
//  Custom Table cells
//
//  Created by Manuel Mouta on 07/03/17.
//  Copyright © 2017 Manuel Mouta. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        CellData.createTableData()
        
        self.tableView.setNeedsLayout()
        self.tableView.layoutIfNeeded()
        
        self.tableView.estimatedRowHeight = 80
        self.tableView.rowHeight          = UITableViewAutomaticDimension
        
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return CellData.cellDataArray.count
    }
    
    public override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        //let cell                = tableView.cellForRow(at: indexPath) as! TableViewCell
        let cell                = Bundle.main.loadNibNamed(TableViewCell.getNibName(), owner: self, options: nil)?.first as! TableViewCell
        let fixedWidth          = cell._txtField?.frame.size.width
        cell._txtField?.sizeThatFits(CGSize(width: (cell._txtField?.frame.size.width)!, height: CGFloat.greatestFiniteMagnitude))
        var size = cell._txtField?.sizeThatFits(CGSize(width: (cell._txtField?.frame.size.width)!, height: CGFloat.greatestFiniteMagnitude))
        let newSize             = cell._txtField?.sizeThatFits(CGSize(width: fixedWidth!, height: CGFloat.greatestFiniteMagnitude))
        var newFrame            = cell._txtField?.frame
        newFrame?.size          = CGSize(width: max((newSize?.width)!, fixedWidth!), height: (newSize?.height)!)
        cell._txtField?.frame   = newFrame!
        var height              = (cell._txtField?.frame.size.height)!
        
        return height
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        //Get the custom cell
        let cell            = Bundle.main.loadNibNamed(TableViewCell.getNibName(), owner: self, options: nil)?.first as! TableViewCell
        cell.objectToShow   = CellData.cellDataArray[indexPath.row]
        
        return cell //setHeightForRow(index : indexPath,cell : cell)
    }
    
    /*func setHeightForRow(index : IndexPath,cell : TableViewCell) -> TableViewCell{

        let fixedWidth          = cell._txtField?.frame.size.width
        cell._txtField?.sizeThatFits(CGSize(width: (cell._txtField?.frame.size.width)!, height: CGFloat.greatestFiniteMagnitude))
        var size = cell._txtField?.sizeThatFits(CGSize(width: (cell._txtField?.frame.size.width)!, height: CGFloat.greatestFiniteMagnitude))
        let newSize             = cell._txtField?.sizeThatFits(CGSize(width: fixedWidth!, height: CGFloat.greatestFiniteMagnitude))
        var newFrame            = cell._txtField?.frame
        newFrame?.size          = CGSize(width: max((newSize?.width)!, fixedWidth!), height: (newSize?.height)!)
        cell._txtField?.frame   = newFrame!
        var height              = (cell._txtField?.frame.size.height)!
        cell.frame.size.height = height
        
        return cell
    }*/

}
