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
    @IBOutlet weak var bestHour: UILabel!
    @IBOutlet weak var lbGoodTimeTitle: UILabel!
    @IBOutlet weak var lbAvailableSeats: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CardViewManager.setShadow(cards)
        
        let pButton = UIBarButtonItem(title: "Perfil", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstViewController.goToProfile))
        navigationItem.rightBarButtonItem = pButton
        
        let updatingText = "..." // "--"
        
        self.lbGoodTimeForLaunch.text = updatingText
        self.lbGoodTimeForLunchSmile.text = ":|"
        self.lbNumberLunched.text = updatingText
        self.lbWaitingTime.text = updatingText
        self.lbPercentLunched.text = updatingText
        self.bestHour.text = updatingText
        self.lbAvailableSeats.text = updatingText
        
        
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
            
            if let num = json["qtd_lugares_Ocupados"] as? Int {
                self.lbNumberLunched.text = "\(num) pessoas estão almoçando"
            }
            
            if let qtd = json["qtd_lugares_Livres"] as? Int {
                self.lbAvailableSeats.text = "\(qtd) lugares disponíveis"
            }
            
            if let num = json["percentualPessoasAlmocaram"] as? Float {
                self.lbPercentLunched.text = "\(Int(num)) %"
            }
            
            if let can = json["podeAlmocar"] as? String {
                if can == "S" {
                    self.lbGoodTimeTitle.text = "Talvez seja rápido"
                    self.lbGoodTimeForLaunch.text = "Agora parece ser uma boa hora para ir almoçar!"
                    self.lbGoodTimeForLunchSmile.text = ":)"
                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.okGreen
                } else if can == "N" {
                    self.lbGoodTimeTitle.text = "Talvez demore"
                    self.lbGoodTimeForLaunch.text = "Agora parece que está meio cheio. Não quer tentar ir um pouco mais tarde?"
                    self.lbGoodTimeForLunchSmile.text = ":("
                    self.lbGoodTimeForLaunchBG.backgroundColor = UIColor.dangerRed
                }
            }
            
            if let best = json["melhorHorario"] as? String {
                self.bestHour.text = best
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

