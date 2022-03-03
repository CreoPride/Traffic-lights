    //
    //  ViewController.swift
    //  Traffic lights
    //
    //  Created by Konstantin Fomenkov on 01.03.2022.
    //

import UIKit

class ViewController: UIViewController {
    enum ActiveLight {
        case red, yellow, green
    }

    @IBOutlet weak var redLightLabel: UIView!
    @IBOutlet weak var yellowLightLabel: UIView!
    @IBOutlet weak var greenLightLabel: UIView!

    @IBOutlet weak var nextButton: UIButton!

    private var activeLight = ActiveLight.red
    private var lightOn: CGFloat = 1
    private var lightOff: CGFloat = 0.3

    override func viewDidLoad() {
        super.viewDidLoad()
        nextButton.configuration = nextButtonConfiguration()

        redLightLabel.backgroundColor = UIColor(red: 1, green: 0.149, blue: 0, alpha: 1)
        yellowLightLabel.backgroundColor = UIColor(red: 1, green: 0.986, blue: 0, alpha: 1)
        greenLightLabel.backgroundColor = UIColor(red: 0.447, green: 0.961, blue: 0.290, alpha: 1)

        redLightLabel.alpha = lightOff
        yellowLightLabel.alpha = lightOff
        greenLightLabel.alpha = lightOff
    }

    override func viewDidLayoutSubviews() {
        redLightLabel.layer.cornerRadius = redLightLabel.frame.height / 2
        yellowLightLabel.layer.cornerRadius = redLightLabel.layer.cornerRadius
        greenLightLabel.layer.cornerRadius = redLightLabel.layer.cornerRadius
    }

    @IBAction func nextButtonTaped() {
        nextButton.configuration?.title = "NEXT"
        nextButton.configuration?.attributedTitle?.font = .boldSystemFont(ofSize: 30)

        switch activeLight {
        case .red:
            activeLight = .yellow
            redLightLabel.alpha = lightOn
            greenLightLabel.alpha = lightOff
        case .yellow:
            activeLight = .green
            yellowLightLabel.alpha = lightOn
            redLightLabel.alpha = lightOff
        case .green:
            activeLight = .red
            greenLightLabel.alpha = lightOn
            yellowLightLabel.alpha = lightOff
        }
    }

    private func nextButtonConfiguration() -> UIButton.Configuration {
        var button = UIButton.Configuration.filled()
        button.baseBackgroundColor = #colorLiteral(red: 0.2017898262, green: 0.200314194, blue: 1, alpha: 1)
        button.title = "START"
        button.attributedTitle?.font = .boldSystemFont(ofSize: 30)
        button.cornerStyle = .medium
        button.buttonSize = .large
        return button
    }
}



