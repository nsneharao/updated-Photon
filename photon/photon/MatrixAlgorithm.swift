//
//  MatrixAlgorithm.swift
//  photon
//
//  Created by Sneha Nemaragomula on 3/8/17.
//  Copyright © 2017 Sneha Nemaragomula. All rights reserved.
//

import UIKit
typealias resultcomplition = (sucess : Bool,Cost: Int, path : [Int],reason : String)
class MatrixAlgorithm: NSObject {
    static let sharedInstance = MatrixAlgorithm()
    
    func ValidMatrix(inputMatrix:[[String]])->(Bool){
        if inputMatrix.count == 0  {
            return false
        }
        if inputMatrix[0].count == 0  {
            return false
        }
        return true
        
    }
    
    func findPath(inputMatrix:[[String]]) ->resultcomplition  {
        
        var Track = [Int]()
        
        if !ValidMatrix(inputMatrix){
            return (false,0,[],"Invalid Matrix")
        }
        
        let firstN = Int(inputMatrix[0][0])
        var count  = firstN
        var indexInt = 0
        var i = 0
        var temp:Int = 0
        
        while i < inputMatrix.count {
            let innerArr = inputMatrix[i]
            temp = 0
            var repeatB = false
            for j in indexInt..<innerArr.count {
                if j+1 < innerArr.count {
                    if i+1<inputMatrix.count {
                        guard let nxt = Int(inputMatrix[i+1][j+1] ) else{
                            return (false,0,Track,"Invalid Matrix")
                        }
                        guard let detailnxt = Int(innerArr[j+1] ) else{
                            return (false,0,Track,"Invalid Matrix")
                        }
                        temp +=  min(nxt, detailnxt)
                        Track.append(i+1)
                        if detailnxt <= nxt  {
                            repeatB = true
                        }
                        
                        indexInt = j + 1
                        break
                    }else{
                        guard let nxt = Int(inputMatrix[i][j+1]) else{
                            return (false,0,Track,"Invalid Matrix")
                        }
                        guard let detailnxt = Int(innerArr[j+1] ) else{
                            return (false,0,Track,"Invalid Matrix")
                            
                        }
                        temp +=  min(nxt, detailnxt)
                        Track.append(i+1)
                        if detailnxt <= nxt  {
                            repeatB = true
                        }
                        indexInt = j + 1
                    }
                }else{
                    
                    if innerArr.count>2 {
                        Track.append(i+1)
                    }
                    indexInt = j
                }
            }
            if count! + temp > 50 {
                return (false,count!,Track,"cost more then 50")
            }
            count! += temp
            if repeatB == false || i+1 == inputMatrix.count {
                i += 1
            }
        }
        return (true,count!,Track,"valid")
        
    }
}
