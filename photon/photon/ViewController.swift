//
//  ViewController.swift
//  photon
//
//  Created by Sneha Nemaragomula on 3/8/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let nextLine = "\n"
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var Button_valid: UIButton!
    @IBOutlet var inPutTxtView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        inPutTxtView.layer.borderWidth = 1
        inPutTxtView.layer.cornerRadius = 5
        inPutTxtView.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        Button_valid.layer.cornerRadius = 5
    
        self.addToolBar(inPutTxtView)
        
        // Do any additional setup after loading the view, typically from a nib.

    }
    
    @IBAction func ClearInput(sender: AnyObject) {
        inPutTxtView.text = ""
        resultLabel.text = ""
    }
    @IBAction func ValidatebtnClicked(sender: UIButton) {
     
        guard let matrix  = StrinToMatrix(inPutTxtView.text!) else{
            return
        }
        let result = MatrixAlgorithm.sharedInstance.findPath(matrix)
        showResult(result)

    }
    
    func StrinToMatrix(input : String)->[[String]]? {
        var matrix = [[String]]()
        let matrixStr = input
        let rows = matrixStr.componentsSeparatedByString(nextLine)
        for Columns in rows {
            if Columns.characters.count == 0 {
                continue
            }
            let eachColumn = Columns.componentsSeparatedByString(",")
            if matrix.count != 0 {
                if matrix[0].count != eachColumn.count{
                    resultLabel.text  = "columns in each row are not same"
                    return nil
                }
            }
            var matrixColunm = [String]()
            for position in eachColumn {
                guard let _ = Int(position.stringByReplacingOccurrencesOfString(" ", withString: ""))else{
                    resultLabel.text  = "invalid Matrix"

                    return nil
                }
                
                matrixColunm.append(position.stringByReplacingOccurrencesOfString(" ", withString: ""))
            }
            if matrixColunm.count != 0 {
                matrix.append(matrixColunm)
            }
        }
        return matrix
    }
    
    func  showResult(result : resultcomplition)  {
        
        var displayString = (result.sucess == true ? "true":"false") + nextLine
        
        displayString = displayString + (result.Cost != 0 ? String(format:"%d",result.Cost) : "") + nextLine
        displayString = displayString + (result.path.count != 0 ? result.path.description : "") + nextLine
        displayString = displayString + (result.reason.characters.count != 0 ? result.reason : "") + nextLine
        
        resultLabel.text = displayString;
        

    }
    @IBAction func preloadMatrixClicked(sender: AnyObject) {
        let tag = (sender as! UIButton).tag
        inPutTxtView.text = ""
        switch tag {
        case 10:
            inPutTxtView.text = MatrixToString(LoadMatrix.get6x5Matrix())
            break
        case 20:
            inPutTxtView.text = MatrixToString(LoadMatrix.get5x3Matrix())
            break
        case 30:
            inPutTxtView.text = MatrixToString(LoadMatrix.get1x5Matrix())
            break
        case 40:
            inPutTxtView.text = MatrixToString(LoadMatrix.Get5x1Matrix())
            break
        case 50:
            inPutTxtView.text = MatrixToString(LoadMatrix.getNonNumeric())
            break

 
        default:
            break
        }
    }
    func MatrixToString(Matrix : [[String]]) -> String {
        var mainStr = ""
        for rows in Matrix {
          let colum = rows.joinWithSeparator(",")
            mainStr = mainStr.characters.count == 0 ? colum : mainStr + nextLine + colum
        }
        return mainStr
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

