//
//  ViewController.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/9/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var contentView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGreen
        
        // let pageViewController = PageViewController()
        guard let pageViewController = storyboard?.instantiateViewController(identifier: String(describing: PageViewController.self)) as? PageViewController else {
            return
        }
        
        addChild(pageViewController)
        contentView.addSubview(pageViewController.view)
        
        // constraints
        let views: [String: Any] = ["pageView": pageViewController.view]

        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[pageView]-0-|",
                                                                  options: NSLayoutConstraint.FormatOptions(rawValue: 0),
                                                                  metrics: nil,
                                                                  views: views))
        
    }
    
}

