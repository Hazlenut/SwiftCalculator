//
//  ViewController.swift
//  Calculator
//
//  Created by William Wung on 11/11/19.
//  Copyright © 2019 William Wung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        var array = [UIButton]()
        let text: [[String]] = [["AC", "+/-", "%", "/"],[ "7", "8", "9", "x"],[ "4","5","6","-" ],[ "1","2,","3","+"]]
        for i in 0...3 {
            for j in 0...3 {
                let button: UIButton = UIButton(frame: CGRect(x: CGFloat(i)*CGFloat(UIScreen.main.bounds.width/4), y:CGFloat(UIScreen.main.bounds.height/5) +  CGFloat(j)*CGFloat(UIScreen.main.bounds.height/5), width: CGFloat(UIScreen.main.bounds.width/4), height: CGFloat(UIScreen.main.bounds.height/5)))
                button.setTitle(text[j][i], for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.layer.cornerRadius = 5
                button.layer.borderWidth = 1
                button.layer.borderColor = UIColor.black.cgColor
                self.view.addSubview(button)
               
            }
        }
            
    }


}

