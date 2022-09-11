//
//  JumpViewController.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/31/21.
//

import UIKit

class JumpViewController: UIViewController {
    
    
    @IBOutlet weak var btnText: UIButton!
    @IBOutlet weak var btnInput: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btnCancel: UIButton!
    
    var current: Int?
    var total: Int?
    var index: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let idx: Int? = current! + 1
        var txt = idx?.description
        txt! += " / "
        txt! += total!.description
//        var txt = "hahah"
        
        // button text
        btnText.setTitle(txt, for: UIControl.State.normal)
        btnText.layer.cornerRadius = 5
        btnText.layer.borderWidth = 2
        btnText.layer.borderColor = UIColor.systemBlue.cgColor
       
        // button input
        btnInput.setTitle("type numbers to input", for: UIControl.State.normal)
        btnInput.layer.cornerRadius = 5
        btnInput.layer.borderWidth = 2
        btnInput.layer.borderColor = UIColor.systemBlue.cgColor
        
        // button 1
        btn1.setTitle("", for: UIControl.State.normal)
//        btn1.backgroundColor = .systemPurple
        btn1.layer.cornerRadius = 5
        btn1.layer.borderWidth = 2
        btn1.layer.borderColor = UIColor.systemGreen.cgColor
        btn1.tag = 1
        btn1.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)

        // button 2
        btn2.setTitle("", for: UIControl.State.normal)
        btn2.layer.cornerRadius = 5
        btn2.layer.borderWidth = 2
        btn2.layer.borderColor = UIColor.systemGreen.cgColor
        btn2.tag = 2
        btn2.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 3
        btn3.setTitle("", for: UIControl.State.normal)
        btn3.layer.cornerRadius = 5
        btn3.layer.borderWidth = 2
        btn3.layer.borderColor = UIColor.systemGreen.cgColor
        btn3.tag = 3
        btn3.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 4
        btn4.setTitle("", for: UIControl.State.normal)
        btn4.layer.cornerRadius = 5
        btn4.layer.borderWidth = 2
        btn4.layer.borderColor = UIColor.systemGreen.cgColor
        btn4.tag = 4
        btn4.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 5
        btn5.setTitle("", for: UIControl.State.normal)
        btn5.layer.cornerRadius = 5
        btn5.layer.borderWidth = 2
        btn5.layer.borderColor = UIColor.systemGreen.cgColor
        btn5.tag = 5
        btn5.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 6
        btn6.setTitle("", for: UIControl.State.normal)
        btn6.layer.cornerRadius = 5
        btn6.layer.borderWidth = 2
        btn6.layer.borderColor = UIColor.systemGreen.cgColor
        btn6.tag = 6
        btn6.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 7
        btn7.setTitle("", for: UIControl.State.normal)
        btn7.layer.cornerRadius = 5
        btn7.layer.borderWidth = 2
        btn7.layer.borderColor = UIColor.systemGreen.cgColor
        btn7.tag = 7
        btn7.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 8
        btn8.setTitle("", for: UIControl.State.normal)
        btn8.layer.cornerRadius = 5
        btn8.layer.borderWidth = 2
        btn8.layer.borderColor = UIColor.systemGreen.cgColor
        btn8.tag = 8
        btn8.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 9
        btn9.setTitle("", for: UIControl.State.normal)
        btn9.layer.cornerRadius = 5
        btn9.layer.borderWidth = 2
        btn9.layer.borderColor = UIColor.systemGreen.cgColor
        btn9.tag = 9
        btn9.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button 0
        btn0.setTitle("", for: UIControl.State.normal)
        btn0.layer.cornerRadius = 5
        btn0.layer.borderWidth = 2
        btn0.layer.borderColor = UIColor.systemGreen.cgColor
        btn0.tag = 0
        btn0.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        // button cancel
        btnCancel.setTitle("", for: UIControl.State.normal)
        btnCancel.layer.cornerRadius = 5
        btnCancel.layer.borderWidth = 2
        btnCancel.layer.borderColor = UIColor.systemGreen.cgColor
        btnCancel.tag = 100
        btnCancel.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        
        NSLayoutConstraint(
                        item: btnCancel,
                        attribute: .width,
                        relatedBy: .equal,
                        toItem: btn0,
                        attribute: .width,
                        multiplier: 2,
                        constant:0).isActive = true
    }
    
    //
    @objc func btnHandler(btn: UIButton) {
        print(btn.tag)
        
        if btn.tag > 10 {
            if index <= 0 {
                return
            }
            
            index /= 10
            if index == 0 {
                btnInput.setTitle("type numbers to input", for: UIControl.State.normal)
            } else {
                btnInput.setTitle(index.description, for: UIControl.State.normal)
            }
            
            return
        }
        
        if index == 0 && btn.tag == 0 {
            return
        }
        
        index *= 10
        index += btn.tag
        if index > total! {
            index = total!
        }
        
        btnInput.setTitle(index.description, for: UIControl.State.normal)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
//         print("current index \(current as Any)")
//         print("total page \(total as Any)")
    }

}
