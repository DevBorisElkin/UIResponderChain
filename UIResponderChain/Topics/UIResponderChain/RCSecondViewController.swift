//
//  RCSecondViewController.swift
//  UIResponderChain
//
//  Created by test on 07.08.2022.
//

import UIKit

class RCSecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}

extension RCSecondViewController: ResponderAction{
    @objc func fetchColor(sender: Any) {
        print("RCSecondViewController -> Caught fetchColor call")
        view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
    }
}
