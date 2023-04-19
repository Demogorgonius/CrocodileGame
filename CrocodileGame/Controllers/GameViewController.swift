//
//  GameViewController.swift
//  CrocodileGame
//
//  Created by Andrey on 18.04.2023.
//

import UIKit
import AVFoundation

class GameViewController: CustomViewController<GameView> {
    
    var secondsLeft = 0
    var countdownTimer = Timer()
    var player: AVAudioPlayer?
    
    // For test
    var getTeam: String {
        get {
            return ["Ковбои", "Стройняшки", "Красотки"].randomElement() ?? ""
        }
    }
    
    var getWord: String {
        get {
            return ["Яблоко", "Собака", "Машина", "Картошка"].randomElement() ?? ""
        }
    }
    
    var getConditionals: String {
        get {
            return ["Объясни с помощью слов", "Объясни с помощью жестов", "Объясни с помощью рисунка"].randomElement() ?? ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
        setupLabelsFromModel()
        setupNavigationBar(textLabel: getTeam)
        startCountdownTimer()
    }
    
    func setupLabelsFromModel() {
        // Add methods from model
        customView.setTargetWordLabel(text: getWord)
        customView.setConditionalsLabel(text: getConditionals)
    }
    
    func startCountdownTimer()  {
        secondsLeft = 60
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerHandler), userInfo: nil, repeats: true)
    }
    
    @objc func timerHandler() {
        if secondsLeft > 0 {
            secondsLeft -= 1
            customView.setTimerLabelText(text: String(format: "%02d:%02d", 0, secondsLeft))
            if secondsLeft == 12 {
                playSound(soundName: "TimerSound", withExtension: "mp3")
            }
        } else {
            countdownTimer.invalidate()
        }
    }
    
    func showResetAlertController() {
        let alertWindow = UIAlertController(
            title: "Сбросить игру?",
            message: "Вы хотите сбросить вашу игру и вернуться в главное меню?",
            preferredStyle: .alert)
        let actionYes = UIAlertAction(
            title: "Да",
            style: .destructive) { (action) in
                //            let mainViewController = MainViewController()
                //            navigationController?.pushViewController(mainViewController, animated: true)
            }
        let actionCancel = UIAlertAction(
            title: "Отмена",
            style: .cancel) { (action) in
                print("Cancel")
            }

        alertWindow.addAction(actionYes)
        alertWindow.addAction(actionCancel)
        
        present(alertWindow, animated: true)
    }
    
    func playSound(soundName: String, withExtension: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: withExtension) else
        { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

// MARK: - GameViewDelegate
extension GameViewController: GameViewDelegate {
    func GameView(_ view: GameView, didTapButton button: UIButton) {
        let buttonIdentifier = button.restorationIdentifier ?? ""
        
        switch buttonIdentifier {
        case "Right":
            print("+1 point, Open RightView")
            playSound(soundName: "RightSound", withExtension: "wav")
//            let rightViewController = RightViewController()
//            navigationController?.pushViewController(rightViewController, animated: true)
        case "Wrong":
            print("Open WrongView")
            playSound(soundName: "WrongSound", withExtension: "wav")
//            let wrongViewController = WrongViewController()
//            navigationController?.pushViewController(wrongViewController, animated: true)
        case "Reset" :
            showResetAlertController()
        default:
            print("Not found")
        }
    }
    
    
}
