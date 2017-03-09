//
//  LoadMatrix.swift
//  photon
//
//  Created by Sneha Nemaragomula on 3/3/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import UIKit

extension UIViewController: UITextViewDelegate{
    func addToolBar(textview: UITextView){
        let  toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.Default
        toolBar.translucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Dismiss", style: UIBarButtonItemStyle.Done, target: self, action: #selector(UIViewController.donePressed))

        let  spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil)
        toolBar.setItems([spaceButton, spaceButton, doneButton], animated: false)
        toolBar.userInteractionEnabled = true
        toolBar.sizeToFit()
        
        textview.delegate = self
        textview.inputAccessoryView = toolBar
    }
    func donePressed(){
        view.endEditing(true)
    }
    func cancelPressed(){
        view.endEditing(true) // or do something
    }
}
class LoadMatrix: NSObject {
   
    class func get6x5Matrix()->[[String]]{
        
        return [ ["3" ,"4" ,"1", "2", "8", "6"],
                 ["6", "1", "8" ,"2" ,"7", "4"],
                 ["5", "9" ,"3" ,"9" ,"9", "5"],
                 ["8", "4", "1", "3", "2", "6"],
                 ["3", "7", "2", "8", "6", "4"]
        ]
    }
  
    
    class func get5x3Matrix()->[[String]]{
        
        return [["19", "10", "19", "10", "19"],
                ["21", "23", "20", "19", "12"],
                ["20", "12", "20", "11", "10"]
        ]
    }
    

    class func get1x5Matrix()->[[String]]{
        return [["5","8","5","3","5"]]
    }
    
    class func Get5x1Matrix()->[[String]]{
        return [["5"],
                ["8"],
                ["5"],
                ["3"],
                ["5"]
        ]
    }
    
   class func getNonNumeric()->[[String]]{
        return [["5", "4", "H"],
                ["8", "M", "7"],
                ["5", "7", "5"]
        ]
        
    }
}
