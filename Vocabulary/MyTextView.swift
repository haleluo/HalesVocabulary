//
//  MyTextView.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/30/21.
//

import UIKit

class MyTextView: UITextView, UITextViewDelegate {
    
    
    override func draw(_ rect: CGRect) {
        self.textContainerInset = UIEdgeInsets.zero
        self.textContainer.lineFragmentPadding = 0
        
        
        //定义一个constrainSize值用于计算textview的高度
        //let constrainSize = CGSize(width: self.frame.size.width, height:CGFloat(MAXFLOAT))
        //获取textview的真实高度
        //let size = self.sizeThatFits(constrainSize)
        //重新设置textview的高度
        //self.frame.size.height = size.height
    }

    
//    
//    func textViewDidChange(_ textView: UITextView) {
//        //定义一个constrainSize值用于计算textview的高度
//        let constrainSize = CGSize(width: textView.frame.size.width, height:CGFloat(MAXFLOAT))
//        //获取textview的真实高度
//        let size = textView.sizeThatFits(constrainSize)
//        //重新设置textview的高度
//        textView.frame.size.height = size.height
//    }
    

}
