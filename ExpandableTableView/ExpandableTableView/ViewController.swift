//
//  ViewController.swift
//  ExpandableTableView
//
//  Created by DG on 19/02/19.
//  Copyright © 2019 Exp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableData:[[String:Any]]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableData = [["title":"Test1",
                      "goal":90,
                      "result":80,
                      "isSelected":false,
                      "detialText":"detail text 123"],
                     ["title":"Test2",
                      "goal":90,
                      "result":80,
                      "isSelected":false,
                      "detialText":"detail text 123 wewf wefwfdwfv"],
                     ["title":"Test3",
                      "goal":90,
                      "result":80,
                      "isSelected":false,
                      "detialText":"detail text 123 wefwj wew"]
        ]
    }


}

extension ViewController : UITableViewDataSource, UITableViewDelegate {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        if (tableData?[indexPath.row]["isSelected"] as? Bool)! {
            return 275
        }else{
            return 90
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandCell", for: indexPath)
        configureCell(cell: cell as! ExpandableCell, forRowAt: indexPath)
        return cell
    }
    
    func configureCell(cell: ExpandableCell, forRowAt indexPath: IndexPath) {
        
        cell.lblHeader.text = tableData?[indexPath.row]["title"] as? String
        cell.lblDetilText.text = tableData?[indexPath.row]["detialText"] as? String
        cell.lblHeader.addImage(imageName: "Drop_Icon-1", afterLabel: false)
        if (tableData?[indexPath.row]["isSelected"] as? Bool)! {
            cell.detialViewHightCons.constant = 175
            cell.detailView.isHidden = false
        }else{
            cell.detialViewHightCons.constant = 0
            cell.detailView.isHidden = true
        }
        
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableData?[indexPath.row]["isSelected"] as? Bool)! {
            tableData?[indexPath.row]["isSelected"] = false
            tableView.reloadRows(at: [indexPath], with: .top)
        }else{
            tableData?[indexPath.row]["isSelected"] = true
            tableView.reloadRows(at: [indexPath], with: .bottom)
        }
    }
    
}

extension UILabel
{
    func addImage(imageName: String, afterLabel bolAfterLabel: Bool = false)
    {
        let attachment: NSTextAttachment = NSTextAttachment()
        attachment.image = UIImage(named: imageName)
        let attachmentString: NSAttributedString = NSAttributedString(attachment: attachment)
        
        if (bolAfterLabel)
        {
            let strLabelText: NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
            strLabelText.append(attachmentString)
            
            self.attributedText = strLabelText
        }
        else
        {
            let strLabelText: NSAttributedString = NSAttributedString(string: self.text!)
            let mutableAttachmentString: NSMutableAttributedString = NSMutableAttributedString(attributedString: attachmentString)
            mutableAttachmentString.append(strLabelText)
            
            self.attributedText = mutableAttachmentString
        }
    }
    
    func removeImage()
    {
        let text = self.text
        self.attributedText = nil
        self.text = text
    }
}

