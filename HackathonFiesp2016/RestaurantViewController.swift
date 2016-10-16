//
//  FirstViewController.swift
//  HackathonFiesp2016
//
//  Created by Jorge Henrique P. Garcia on 15/10/16.
//  Copyright © 2016 Jhpg. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet var cards: [UIView]!
    @IBOutlet weak var lbWaitingTime: UILabel!
    @IBOutlet weak var lbPercentLunched: UILabel!
    @IBOutlet weak var lbNumberLunched: UILabel!
    @IBOutlet weak var lbGoodTimeForLaunch: UILabel!
    @IBOutlet weak var lbGoodTimeForLunchSmile: UILabel!
    @IBOutlet weak var lbGoodTimeForLaunchBG: UIView!
//    @IBOutlet weak var lbPoints: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CardViewManager.setShadow(cards)
        
        let pButton = UIBarButtonItem(title: "Perfil", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstViewController.goToProfile))
        navigationItem.rightBarButtonItem = pButton
        
        APIManager.getAPIdata() { json in
            
            if let wait = json["tempoEspera"] as? Float {
                if wait > 5 {
                    self.lbWaitingTime.textColor = UIColor.dangerRed
                } else {
                    self.lbWaitingTime.textColor = UIColor.okGreen
                }
                self.lbWaitingTime.text = "\(wait) min"
            } else { self.lbWaitingTime.text = "--" }
            
            if let num = json["porPessoasalmocando"] as? Int {
                self.lbNumberLunched.text = "\(num) pessoas já almoçaram"
            } else { self.lbNumberLunched.text = "--" }
            
            if let can = json["podeAlmocar"] as? Bool {
                if can {//== 1 {
                    self.lbGoodTimeForLunchSmile.text = ":)"
                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.okGreen
                } else { //if can == 0 {
                    self.lbGoodTimeForLunchSmile.text = ":|"
                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.dangerRed
                } // else if can == -1 {
//                    self.lbGoodTimeForLunchSmile.text = ":("
//                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.dangerRed
//                }
            } else { self.lbGoodTimeForLunchSmile.text = ":|" }
            
            print(json)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func goToProfile(){
        let storyboard = UIStoryboard(name:"Main", bundle:nil);
        let controller = storyboard.instantiateViewController(withIdentifier:"profileView");
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

