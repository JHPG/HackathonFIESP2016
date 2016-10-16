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


//extension UIView {
//    
//    var myshadow: Bool {
//        set {
//            if myshadow {
//                let view = self
//                let shadowPath = UIBezierPath(rect: view.bounds)
//                view.layer.masksToBounds = false
//                view.layer.shadowColor = UIColor.black.cgColor
//                view.layer.shadowOffset = CGSize(width: 0, height: 0.5)
//                view.layer.shadowOpacity = 0.2
//                view.layer.shadowPath = shadowPath.cgPath
//            }
//        }
//        get{
//            return false
//        }
//    }
//}

import Alamofire

typealias JsonObject = [String: AnyObject]


class APIManager {
    
    private static let serverUrl = "http://zebra.azurewebsites.net/"
    
    class func getAPIdata(completion: @escaping (_ json: JsonObject)->()) {
        
        let url = APIManager.serverUrl + "api/refeitorio"
        
        Alamofire.request(url).responseJSON { response in
            if let json = response.result.value as? JsonObject,
                let data = json["data"] as? JsonObject {
//                print("JSON: \(json)")
                
                completion(data)  //TODO: Colocar minutos
            } else {
                print(#function, "Json conversion error")
            }
            
        }
    }
    
    
    
    
}

