//
//  ViewController.swift
//  ConnectText
//
//  Created by Denis Svichkarev on 07/10/2019.
//  Copyright © 2019 Denis Svichkarev. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet var leftTextView: NSTextView!
    @IBOutlet var rightTextView: NSTextView!
    @IBOutlet var resultTextView: NSTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - IB Actions
    
    @IBAction func onLeftClearButtonPressed(_ sender: Any) {
        leftTextView.string = ""
    }
    
    @IBAction func onRightClearButtonPressed(_ sender: Any) {
        rightTextView.string = ""
    }
    
    @IBAction func onRunButtonPressed(_ sender: Any) {
        let leftText = leftTextView.string
        let leftLines = leftText.split(separator: "\n")
        
        let rightText = rightTextView.string
        let rightLines = rightText.split(separator: "\n")
        
        if leftLines.count != rightLines.count {
            resultTextView.string = "Error: leftLines.count != rightLines.count"
            return
        }
        
        resultTextView.string = ""
        var finalString: String = ""

        for i in 0..<leftLines.count {
            finalString.append(leftLines[i] + "/" + rightLines[i] + "\n")
        }

        resultTextView.string = finalString
    }
    
    @IBAction func onCopyButtonPressed(_ sender: Any) {
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([NSPasteboard.PasteboardType.string], owner: nil)
        pasteboard.setString(resultTextView.string, forType: NSPasteboard.PasteboardType.string)
    }
}

