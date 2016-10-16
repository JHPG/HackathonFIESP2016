//
//  SecondViewController.swift
//  HackathonFiesp2016
//
//  Created by Jorge Henrique P. Garcia on 15/10/16.
//  Copyright © 2016 Jhpg. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var cards: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CardViewManager.setShadow(cards)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

