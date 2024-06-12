//
//  ResultsViewController.swift
//  Quizzler
//
//  Created by Eclipse on 12/06/24.
//  Copyright © 2024 Eclipse. All rights reserved.
//

import UIKit

extension Notification.Name {
    static let didDismissResultsViewController = Notification.Name("didDismissResultsViewController")
}

class ResultsViewController: UIViewController {
    var score: String?
    @IBOutlet weak var scoreLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = score
    }
    @IBAction func restartPressed(_ sender: UIButton){
        NotificationCenter.default.post(name: .didDismissResultsViewController, object: nil)
        self.dismiss(animated: true, completion: nil)
    }

}
