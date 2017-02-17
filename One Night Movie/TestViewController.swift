//
//  TestViewController.swift
//  One Night Movie
//
//  Created by Simon Chrétien on 13/02/2017.
//  Copyright © 2017 Simon Chrétien. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.testScrollView.contentSize = CGSize(width: self.testScrollView.frame.width, height: 10000)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
