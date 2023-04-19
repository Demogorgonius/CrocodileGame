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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startCountdownTimer()
        customView.delegate = self
    }
    
    func startCountdownTimer()  {
        secondsLeft = 60
        countdownTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerHandler), userInfo: nil, repeats: true)
    }
    
    @objc func timerHandler() {
        if secondsLeft > 0 {
            secondsLeft -= 1
            customView.setTimerLabelText(text: String(format: "%02d:%02d", 0, secondsLeft))
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
            print("Return to MainView")
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
        case "Wrong":
            print("Open WrongView")
            playSound(soundName: "WrongSound", withExtension: "wav")
        case "Reset" :
            showResetAlertController()
        default:
            print("Not found")
        }
    }
    
}
