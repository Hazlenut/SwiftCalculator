//
//  ViewController.swift
//  Calculator
//
//  Created by William Wung on 11/11/19.
//  Copyright © 2019 William Wung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let a = UIButton()

    var array = [[UIButton]](repeating: [UIButton](repeating: UIButton(), count: 4), count: 5)
    let text: [[String]] = [["AC", "+/-", "%", "/"],[ "7", "8", "9", "x"],[ "4","5","6","-" ],[ "1","2","3","+"],["0","H",".","="]]
    var label = UILabel();
    var barValue = "";
    //make H a history popup

    override func viewDidLoad() {
        
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        //set up calc layout
        label = UILabel(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height/5))
        label.text = barValue;
        label.layer.borderWidth = 2
        label.font = UIFont(name: "Verdana-Bold", size: 30)
        self.view.addSubview(label)
        for i in 0...3 {
            for j in 0...4 {
                array[j][i] = UIButton(frame: CGRect(x: CGFloat(i)*CGFloat(UIScreen.main.bounds.width/4), y:CGFloat(UIScreen.main.bounds.height/5) +  CGFloat(j)*CGFloat((UIScreen.main.bounds.height-(UIScreen.main.bounds.height/5))/5), width: CGFloat(UIScreen.main.bounds.width/4), height: CGFloat((UIScreen.main.bounds.height-(UIScreen.main.bounds.height/5))/5)))
                    array[j][i].setTitle(text[j][i], for: .normal)
                    array[j][i].setTitleColor(.black, for: .normal)
                    array[j][i].layer.borderWidth = 1
                    array[j][i].layer.borderColor = UIColor.black.cgColor
                    array[j][i].titleLabel?.font = UIFont(name: "Verdana-Bold", size: 30)
                    print(j)
                    print(" ")
                    print(i)
                    print(" ")
                    print(text[j][i])
                    self.view.addSubview(array[j][i])
               
            }
        }
        // finish calc layout
        
        //add functions to each button
        
        for i in 0...3 {
            for j in 0...4 {
                if i == 0 {
                    if j == 1 {
                        array[j][i].addTarget(self, action: #selector(seven), for: .touchUpInside)
                    }else if j == 2 {
                        array[j][i].addTarget(self, action: #selector(four), for: .touchUpInside)
                    }else if j == 3 {
                        array[j][i].addTarget(self, action: #selector(one), for: .touchUpInside)
                    }else if j == 4 {
                        array[j][i].addTarget(self, action: #selector(zero), for: .touchUpInside)
                    }else {
                        array[j][i].addTarget(self, action: #selector(clear), for: .touchUpInside)
                    }
                }else if i == 1 {
                    if j == 0 {
                        array[j][i].addTarget(self, action: #selector(changeSign), for: .touchUpInside)
                    }else if j == 1 {
                        array[j][i].addTarget(self, action: #selector(eight), for: .touchUpInside)
                    }else if j == 2 {
                        array[j][i].addTarget(self, action: #selector(five), for: .touchUpInside)
                    }else if j == 3 {
                        array[j][i].addTarget(self, action: #selector(two), for: .touchUpInside)
                    }else if j == 4 {
                        
                    }
                }else if i == 2 {
                    if j == 1 {
                        array[j][i].addTarget(self, action: #selector(nine), for: .touchUpInside)
                    }else if j == 2 {
                        array[j][i].addTarget(self, action: #selector(six), for: .touchUpInside)
                    }else if j == 3 {
                        array[j][i].addTarget(self, action: #selector(three), for: .touchUpInside)
                    }else if j == 4 {
                        array[j][i].addTarget(self, action: #selector(decimal), for: .touchUpInside)
                    }else if j == 0 {
                    
                    }
                }
        }
        }
        
        
            
    }
    @objc func seven() {
        barValue += "7";
        label.text = barValue;
        
    }
    @objc func four() {
        barValue += "4";
        label.text = barValue;
    }
    @objc func one() {
           barValue += "1";
           label.text = barValue;
       }
    @objc func zero() {
           barValue += "0";
           label.text = barValue;
       }
    @objc func clear() {
           barValue = ""
           label.text = barValue;
       }
   @objc func changeSign() {
    if barValue[0] == "-" {
        barValue = barValue.substring(fromIndex: 1)
    }else{
        let temp = "-";
        barValue = temp + barValue;
    }
        label.text = barValue;
      }
    @objc func eight() {
       barValue += "8";
        label.text = barValue;
    }
    @objc func five() {
        barValue += "5";
        label.text = barValue;
    }
    @objc func two() {
        barValue += "2";
        label.text = barValue;
    }
    @objc func nine() {
        barValue += "9";
        label.text = barValue;
    }
    @objc func six() {
        barValue += "6";
        label.text = barValue;
    }
    @objc func three() {
        barValue += "3";
        label.text = barValue;
    }
    @objc func decimal() {
        barValue += ".";
        label.text = barValue;
    }
    

    
}
extension String {

  var length: Int {
    return count
  }

  subscript (i: Int) -> String {
    return self[i ..< i + 1]
  }

  func substring(fromIndex: Int) -> String {
    return self[min(fromIndex, length) ..< length]
  }

  func substring(toIndex: Int) -> String {
    return self[0 ..< max(0, toIndex)]
  }

  subscript (r: Range<Int>) -> String {
    let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                        upper: min(length, max(0, r.upperBound))))
    let start = index(startIndex, offsetBy: range.lowerBound)
    let end = index(start, offsetBy: range.upperBound - range.lowerBound)
    return String(self[start ..< end])
  }

}

