//
//  OnlyShadowVIewController.swift
//  HackathonFiesp2016
//
//  Created by Jorge Henrique P. Garcia on 16/10/16.
//  Copyright © 2016 Jhpg. All rights reserved.
//

import UIKit


class OnlyShadowViewController: UIViewController {
    @IBOutlet var cards: [UIView]!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        CardViewManager.setShadow(cards)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        resignFirstResponder()
    }


}
