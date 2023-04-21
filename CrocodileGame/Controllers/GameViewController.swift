//
//  GameViewController.swift
//  CrocodileGame
//
//  Created by Andrey on 18.04.2023.
//

import UIKit
import AVFoundation

class GameViewController: CustomViewController<GameView> {
    
    let gameManager = GameManager()
    
    var secondsLeft = 0
    var countdownTimer = Timer()
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        setupLabelsFromModel()
        setupNavigationBar(textLabel: gameManager.getCurrentTeam().name)
        startCountdownTimer()
    }
    
    func setupLabelsFromModel() {
        customView.setTargetWordLabel(text: gameManager.getWord().word)
        customView.setConditionalsLabel(text: gameManager.getWord().conditionals)
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
                self.countdownTimer.invalidate()
                //            navigationController?.popViewController(mainViewController, animated: true)
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
            gameManager.rightAnswer()
            countdownTimer.invalidate()
            playSound(soundName: "RightSound", withExtension: "wav")
            let rightViewController = RightViewController()
            rightViewController.gameManager = gameManager
            navigationController?.pushViewController(rightViewController, animated: true)
        case "Wrong":
            countdownTimer.invalidate()
            playSound(soundName: "WrongSound", withExtension: "wav")
            let wrongViewController = WrongViewController()
            wrongViewController.gameManager = gameManager
            navigationController?.pushViewController(wrongViewController, animated: true)
        case "Reset" :
            showResetAlertController()
        default:
            print("Not found")
        }
    }
    
    
}
