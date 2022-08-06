//
//  ViewController.swift
//  UIResponderChain
//
//  Created by test on 06.08.2022.
//

import UIKit

class ResponderChainFirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("ViewController.touchesBegan")
    }

}

