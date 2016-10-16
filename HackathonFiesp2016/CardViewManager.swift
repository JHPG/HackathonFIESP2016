//
//  CardViewManager.swift
//  HackathonFiesp2016
//
//  Created by Jorge Henrique P. Garcia on 15/10/16.
//  Copyright © 2016 Jhpg. All rights reserved.
//

import Foundation
import UIKit

class CardViewManager {

    class func setShadow(_ cards: [UIView]){
        
        for c in cards {
            let view = c
            let shadowPath = UIBezierPath(rect: view.bounds)
            view.layer.masksToBounds = false
            view.layer.shadowColor = UIColor.black.cgColor
            view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
            view.layer.shadowOpacity = 0.2
            view.layer.shadowPath = shadowPath.cgPath
        }
        
    }

}

import Alamofire

typealias JsonObject = [String: AnyObject]


class APIManager {
    
    private static let serverUrl = ""
    
    class func getEstimatedTime(completion: @escaping (_ minutes: Float)->()) {
        
        let url = APIManager.serverUrl + ""
        
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? JsonObject {
                print("JSON: \(json)")
                
                completion(10)  //TODO: Colocar minutos
            } else {
                print(#function, "Json conversion error")
            }
            
        }
    }
    
    
    
    
}

