//
//  RCThirdViewController.swift
//  UIResponderChain
//
//  Created by test on 07.08.2022.
//

import UIKit

class RCThirdViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func executeAction(_ sender: Any) {
        print("Pressed execute action button")
        
        UIApplication.shared.sendAction(#selector(ResponderAction.fetchColor), to: nil, from: self, for: nil)
    }
}

// ThisVC -> Window -> UIApplication -> AppDelegate
// Use container view to pass data with this method to previous view controllers

//extension RCThirdViewController: ResponderAction {
//    @objc func fetchColor(sender: Any) {
//        print("RCThirdViewController caught fetchColor action")
//        var alert = UIAlertController()
//        alert.addAction(UIAlertAction(title: "Okay", style: .cancel))
//        present(alert, animated: true)
//    }
//}
