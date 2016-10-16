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
        
        self.lbGoodTimeForLaunch.text = "--"
        self.lbNumberLunched.text = "--"
        self.lbWaitingTime.text = "--"
        self.lbGoodTimeForLunchSmile.text = ":|"
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(FirstViewController.updateData), userInfo: nil, repeats: true)
    }

    func updateData() {
        APIManager.getAPIdata() { json in
            
            if let wait = json["tempoEspera"] as? Float {
                if wait > 5 {
                    self.lbWaitingTime.textColor = UIColor.dangerRed
                } else {
                    self.lbWaitingTime.textColor = UIColor.okGreen
                }
                self.lbWaitingTime.text = "\(Int(wait)) min"
            }
            
            if let num = json["qtdPessoasAlmocaram"] as? Int {
                self.lbNumberLunched.text = "\(num) pessoas já almoçaram"
            }
            
            if let num = json["percentualPessoasAlmocaram"] as? Float {
                self.lbPercentLunched.text = "\(Int(num)) %"
            }
            
            if let can = json["podeAlmocar"] as? String {
                if can == "S" {
                    self.lbGoodTimeForLaunch.text = "Agora parece ser uma boa hora para ir almoçar!"
                    self.lbGoodTimeForLunchSmile.text = ":)"
                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.okGreen
                } else if can == "N" {
                    self.lbGoodTimeForLaunch.text = "Agora parece que está meio cheio. Não quer tentar ir um pouco mais tarde?"
                    self.lbGoodTimeForLunchSmile.text = ":("
                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.dangerRed
                }
            }
            
            print("Data: \(json)")
        }
    }
    
    func goToProfile(){
        let storyboard = UIStoryboard(name:"Main", bundle:nil);
        let controller = storyboard.instantiateViewController(withIdentifier:"profileView");
        self.navigationController?.pushViewController(controller, animated: true)
    }

}

