//
//  ViewController.swift
//  Traffic lights
//
//  Created by Konstantin Fomenkov on 01.03.2022.
//

import UIKit

class ViewController: UIViewController {

    enum ActiveView {
        case red, yellow, green
    }

    @IBOutlet var lightsLabels: [UIView]!
    @IBOutlet weak var nextButton: UIButton!

    private var activeView = ActiveView.red

    override func viewDidLoad() {
        super.viewDidLoad()
        ligthsConfiguration()
        nextButton.configuration = nextButtonConfiguration()
    }

    @IBAction func nextButtonTaped() {
    }

    private func nextButtonConfiguration() -> UIButton.Configuration {
        var button = UIButton.Configuration.filled()
        button.baseBackgroundColor = #colorLiteral(red: 0.2017898262, green: 0.200314194, blue: 1, alpha: 1)
        button.title = "NEXT"
        button.attributedTitle?.font = UIFont.boldSystemFont(ofSize: 30)
        button.cornerStyle = .medium
        button.buttonSize = .large
        return button
    }

    private func ligthsConfiguration() {
        for light in lightsLabels {
            light.layer.cornerRadius = light.frame.width / 2
            light.alpha = 0.3
        }
    }
}

