//
//  WordViewController.swift
//  Vocabulary
//
//  Created by 罗海林 on 10/10/21.
//

import UIKit

class WordViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var firstLine: UIStackView!
    
    @IBOutlet weak var txtWord: UITextView!
    @IBOutlet weak var lblDot: UILabel!
    @IBOutlet weak var lblSoundmark: UILabel!
    
    @IBOutlet weak var lblPart: UILabel!
    @IBOutlet weak var lblLine: UILabel!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var content: UIView!
    
    @IBOutlet weak var txtTitle: UITextView!
    @IBOutlet weak var txtDef: UITextView!
    
    @IBOutlet weak var lblDExamples: UILabel!
    @IBOutlet weak var stackDExapmles: UIStackView!
    @IBOutlet weak var lblLExamples: UILabel!
    @IBOutlet weak var stackLExamples: UIStackView!
    

    @IBOutlet weak var btnIndex: UIButton!
    
    var index: Int?
    var total: Int?
    var wordText: String?
    var soundmakText: String?
    var partText: String?
    var tagText: String?
    var titleText: String?
    var defText: String?
    var dExamples: [VocabularyExampleItem]?
    var lExamples: [VocabularyExampleItem]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let idx: Int? = index! + 1
        var txt = idx?.description
        txt! += " / "
        txt! += total!.description
        btnIndex.setTitle(txt, for: UIControl.State.normal)
        
        firstLine.addArrangedSubview(UILabel())
        
        txtWord.textContainerInset = UIEdgeInsets.zero
        txtWord.textContainer.lineFragmentPadding = 0
        txtWord.text = wordText
        txtWord.font = UIFont.boldSystemFont(ofSize: 26)
        
        let txtWordCGSize = CGSize(width: txtWord.frame.size.width, height:CGFloat(MAXFLOAT))
        let txtWordSize = txtWord.sizeThatFits(txtWordCGSize)
        txtWord.frame.size.height = txtWordSize.height
        
        lblSoundmark.text = soundmakText
        lblSoundmark.font = UIFont.systemFont(ofSize: 15)
        
        NSLayoutConstraint(
            item: firstLine,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: stackView,
            attribute: .top,
            multiplier: 1,
            constant: txtWordSize.height).isActive = true
        
        lblPart.text = partText
        if tagText != "" {
            lblPart.text! += " [" + tagText! + "]"
        }
        
        NSLayoutConstraint(
            item: container,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: lblLine,
            attribute: .bottom,
            multiplier: 1,
            constant: 600).isActive = true
        
        
        //
        txtTitle.textContainerInset = UIEdgeInsets.zero
        txtTitle.textContainer.lineFragmentPadding = 0
        txtTitle.text = titleText
        txtTitle.font = UIFont.boldSystemFont(ofSize: 18)
        
        let txtTitleCGSize = CGSize(width: txtTitle.frame.size.width, height:CGFloat(MAXFLOAT))
        let txtTitleSize = txtTitle.sizeThatFits(txtTitleCGSize)
        txtTitle.frame.size.height = txtTitleSize.height
        
        NSLayoutConstraint(
            item: txtTitle,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: content,
            attribute: .top,
            multiplier: 1,
            constant: txtTitleSize.height).isActive = true
        
        //
        txtDef.textContainerInset = UIEdgeInsets.zero
        txtDef.textContainer.lineFragmentPadding = 0
        txtDef.text = defText
        txtDef.font = UIFont.systemFont(ofSize: 15)
        
        let txtDefCGSize = CGSize(width: txtDef.frame.size.width, height:CGFloat(MAXFLOAT))
        let txtDefSize = txtDef.sizeThatFits(txtDefCGSize)
        
        NSLayoutConstraint(
            item: txtDef,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: txtDefSize.height).isActive = true
        
        
//        dExamples?.forEach{item in
//            let exampleView = UIView()
//            exampleView.backgroundColor = .systemPurple
//            exampleView.contentMode = .scaleToFill
//
//            let starLbl = UILabel()
//            starLbl.backgroundColor = .systemBrown
//            starLbl.text = "⋆"
//            starLbl.font = UIFont.boldSystemFont(ofSize: 25)
//            exampleView.addSubview(starLbl)
//            let starLblCGSize = CGSize(width: starLbl.frame.size.width, height:CGFloat(MAXFLOAT))
//            let starLblSize = starLbl.sizeThatFits(starLblCGSize)
//            print("starLblSize.width", starLblSize.width)
//            print("starLblSize.height", starLblSize.height)
//
//            NSLayoutConstraint(
//                item: starLbl,
//                attribute: .top,
//                relatedBy: .equal,
//                toItem: exampleView,
//                attribute: .top,
//                multiplier: 1,
//                constant: 0).isActive = true
//            NSLayoutConstraint(
//                item: starLbl,
//                attribute: .leading,
//                relatedBy: .equal,
//                toItem: exampleView,
//                attribute: .leading,
//                multiplier: 1,
//                constant: 0).isActive = true
//            NSLayoutConstraint(
//                item: starLbl,
//                attribute: .width,
//                relatedBy: .equal,
//                toItem: nil,
//                attribute: .notAnAttribute,
//                multiplier: 1,
//                constant: starLblSize.width).isActive = true
//            NSLayoutConstraint(
//                item: starLbl,
//                attribute: .height,
//                relatedBy: .equal,
//                toItem: nil,
//                attribute: .notAnAttribute,
//                multiplier: 1,
//                constant: starLblSize.height).isActive = true
//
//
//            let txtEx = UITextView()
//            txtEx.isEditable = false
//            txtEx.isScrollEnabled = false
//            txtEx.contentInsetAdjustmentBehavior = .automatic
//            txtEx.textAlignment = NSTextAlignment.justified
//            txtEx.backgroundColor = .systemGreen
//            //txtEx.textContainerInset = UIEdgeInsets.zero
//            txtEx.text = item.content
//            txtEx.font = UIFont.systemFont(ofSize: 15)
//            let txtExCGSize = CGSize(width: txtEx.frame.size.width, height:CGFloat(MAXFLOAT))
//            let txtExSize = txtEx.sizeThatFits(txtExCGSize)
//            exampleView.addSubview(txtEx)
//            print("txtExSize.width", txtExSize.width)
//            print("txtExSize.height", txtExSize.height)
//
//            NSLayoutConstraint(
//                item: txtEx,
//                attribute: .top,
//                relatedBy: .equal,
//                toItem: exampleView,
//                attribute: .top,
//                multiplier: 1,
//                constant: 0).isActive = true
//            NSLayoutConstraint(
//                item: txtEx,
//                attribute: .leading,
//                relatedBy: .equal,
//                toItem: starLbl,
//                attribute: .trailing,
//                multiplier: 1,
//                constant: 0).isActive = true
//            NSLayoutConstraint(
//                item: starLbl,
//                attribute: .trailing,
//                relatedBy: .equal,
//                toItem: exampleView,
//                attribute: .trailing,
//                multiplier: 1,
//                constant: 0).isActive = true
//            NSLayoutConstraint(
//                item: starLbl,
//                attribute: .height,
//                relatedBy: .equal,
//                toItem: nil,
//                attribute: .notAnAttribute,
//                multiplier: 1,
//                constant: txtExSize.height).isActive = true
//
//            var exampleViewHeight: CGFloat = starLblSize.height > txtExSize.height ? starLblSize.height : txtExSize.height
//
//            NSLayoutConstraint(
//                item: exampleView,
//                attribute: .height,
//                relatedBy: .equal,
//                toItem: nil,
//                attribute: .notAnAttribute,
//                multiplier: 1,
//                constant: exampleViewHeight).isActive = true
//
//
//            stackDExapmles.addArrangedSubview(exampleView)
//        }
        

//        var i: Int = 0
//        var totalHeight: CGFloat = 0
        dExamples?.forEach{item in
//            i += 1
            let stackItem = UIStackView()
//            stackItem.backgroundColor = .systemOrange
            stackItem.axis = .horizontal
            stackItem.alignment = .firstBaseline
            stackItem.distribution = .fill

//            let starLbl = UILabel()
//            starLbl.backgroundColor = .systemBrown
//            starLbl.text = "⋆"
//            starLbl.font = UIFont.boldSystemFont(ofSize: 25)
//            stackItem.addArrangedSubview(starLbl)
//            let starLblCGSize = CGSize(width: starLbl.frame.size.width, height:CGFloat(MAXFLOAT))
//            let starLblSize = starLbl.sizeThatFits(starLblCGSize)
//            print("starLblSize.height", starLblSize.height)


            let txtEx = UITextView()
            txtEx.isEditable = false
            txtEx.isScrollEnabled = false

            txtEx.contentInsetAdjustmentBehavior = .automatic
            txtEx.textAlignment = NSTextAlignment.justified
            txtEx.backgroundColor = .systemGray4
//            txtEx.textContainerInset = UIEdgeInsets.zero
            txtEx.text = item.content
            txtEx.font = UIFont.systemFont(ofSize: 15)
            let txtExCGSize = CGSize(width: txtEx.frame.size.width, height:CGFloat(MAXFLOAT))
            let txtExSize = txtEx.sizeThatFits(txtExCGSize)
            stackItem.addArrangedSubview(txtEx)
//            print("txtExSize.height", txtExSize.height)

//            var stackItemHeight = starLblSize.height > txtExSize.height ? starLblSize.height : txtExSize.height
//            totalHeight += stackItemHeight
//            totalHeight += txtExSize.height
//            if i != dExamples?.count {
//                totalHeight += 5
//            }

//            NSLayoutConstraint(
//                item: txtEx,
//                attribute: .height,
//                relatedBy: .equal,
//                toItem: nil,
//                attribute: .notAnAttribute,
//                multiplier: 1,
//                constant: txtExSize.height).isActive = true
//
//            NSLayoutConstraint(
//                item: stackItem,
//                attribute: .height,
//                relatedBy: .equal,
//                toItem: nil,
//                attribute: .notAnAttribute,
//                multiplier: 1,
//                constant: txtExSize.height).isActive = true


//            stackItem.addArrangedSubview(UILabel())
            stackDExapmles.addArrangedSubview(stackItem)
        }

//        NSLayoutConstraint(
//            item: stackDExapmles,
//            attribute: .height,
//            relatedBy: .equal,
//            toItem: nil,
//            attribute: .notAnAttribute,
//            multiplier: 1,
//            constant: totalHeight).isActive = true
  
        
        lExamples?.forEach{item in
            let stackItem = UIStackView()
//            stackItem.backgroundColor = .systemOrange
            stackItem.axis = .horizontal
            stackItem.alignment = .firstBaseline
            stackItem.distribution = .fill

            let txtEx = UITextView()
            txtEx.isEditable = false
            txtEx.isScrollEnabled = false
            txtEx.contentInsetAdjustmentBehavior = .automatic
            txtEx.textAlignment = NSTextAlignment.justified
            txtEx.backgroundColor = .systemGray4
//            txtEx.textContainerInset = UIEdgeInsets.zero
            txtEx.text = item.content
            txtEx.font = UIFont.systemFont(ofSize: 15)
            let txtExCGSize = CGSize(width: txtEx.frame.size.width, height:CGFloat(MAXFLOAT))
            let txtExSize = txtEx.sizeThatFits(txtExCGSize)
            stackItem.addArrangedSubview(txtEx)
//            print("txtExSize.height", txtExSize.height)

            stackLExamples.addArrangedSubview(stackItem)
        }
        
//
//        lExamples?.forEach{item in
//            let stackItem = UIStackView()
//            stackItem.backgroundColor = .systemGreen
//            stackItem.axis = .horizontal
//            stackItem.alignment = .firstBaseline
//            stackItem.distribution = .fill
//
//            let starLbl = UILabel()
//            starLbl.backgroundColor = .systemBrown
//            starLbl.text = "⋆"
//            starLbl.font = UIFont.boldSystemFont(ofSize: 25)
//            stackItem.addArrangedSubview(starLbl)
//            let starLblCGSize = CGSize(width: starLbl.frame.size.width, height:CGFloat(MAXFLOAT))
//            let starLblSize = starLbl.sizeThatFits(starLblCGSize)
//
//
//            let txtEx = UITextView()
//            txtEx.contentInsetAdjustmentBehavior = .automatic
//            txtEx.textAlignment = NSTextAlignment.justified
//            txtEx.backgroundColor = .systemGreen
//            txtEx.textContainerInset = UIEdgeInsets.zero
//            txtEx.textContainer.lineFragmentPadding = 0
//            txtEx.text = item.content
//            txtEx.font = UIFont.systemFont(ofSize: 20)
//            let txtExCGSize = CGSize(width: txtEx.frame.size.width, height:CGFloat(MAXFLOAT))
//            let txtExSize = txtEx.sizeThatFits(txtExCGSize)
//            txtEx.frame.size.height = txtExSize.height
//            txtEx.frame.size.width = txtExSize.width
//            stackItem.addArrangedSubview(txtEx)
//
//
//            stackLExamples.addArrangedSubview(stackItem)
//        }
//
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print("prepare word")
//        print("index \(index as Any)")
//        print("total \(total as Any)")
        guard let navController = segue.destination as? UINavigationController, let viewController = navController.topViewController as? JumpViewController else {
              return
        }

        viewController.current = index
        viewController.total = total
    }
    

}
