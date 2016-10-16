//
//  SocialViewController.swift
//  HackathonFiesp2016
//
//  Created by Jorge Henrique P. Garcia on 16/10/16.
//  Copyright © 2016 Jhpg. All rights reserved.
//

//
//  SecondViewController.swift
//  HackathonFiesp2016
//
//  Created by Jorge Henrique P. Garcia on 15/10/16.
//  Copyright © 2016 Jhpg. All rights reserved.
//

import UIKit

class SocialViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet var cards: [UIView]!
    @IBOutlet weak var score: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CardViewManager.setShadow(cards)
        
        let pButton = UIBarButtonItem(title: "Perfil", style: UIBarButtonItemStyle.plain, target: self, action: #selector(FirstViewController.goToProfile))
        navigationItem.rightBarButtonItem = pButton
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder()
    }
    
    func goToProfile(){
        let storyboard = UIStoryboard(name:"Main", bundle:nil);
        let controller = storyboard.instantiateViewController(withIdentifier:"profileView");
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        
    }

    
    
}


