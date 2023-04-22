//
//  ViewController.swift
//  ScrollView
//
//  Created by Zhaniya on 21.04.2023.
//
import UIKit

class RulesViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let contentView = UIView()
    let button = UIButton(type: .system)
    
    
  
   
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        func setupScrollView(){
           
            //scrollView.backgroundColor = .blue
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            contentView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(scrollView)
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           
            scrollView.addSubview(contentView)
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
        setupScrollView()
        
        
        
        
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.text = "Правила игры"
            label.numberOfLines = 0
            label.sizeToFit()
            label.textColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            let font = UIFont(name: "Helvetica", size: 20.0)
            let attributes = [NSAttributedString.Key.font: font]
            let attributedString = NSAttributedString(string: label.text ?? "", attributes: attributes as [NSAttributedString.Key : Any])
            label.attributedText = attributedString
            return label
        }()
        
        let subtitleLabel: UILabel = {
            let label = UILabel()
            label.text = "\n Один из участников встает напротив других игроков и начинает изображать загаданное слово. Задача остальных назвать это понятие в той форме, в которой оно было задумано. \n\n Изображать можно любое определение. Для детей можно упростить задачу и загадывать только существительные в именительном падеже и единственном числе. \n\n Исключение составляют те формы, которые не имеют единственного числа, например: ножницы, часы, брюки. \n\n Во время показа нельзя произносить какие-либо звуки, шевелить губами, говорить «да» или «нет» на предположения других игроков. Также запрещается показывать руками или рисовать в воздухе буквы, из которых состоит слово. \n\n Отгадывающие могут задавать любые уточняющие вопросы, а также перечислять любые варианты, которые приходят на ум.На разгадку каждой идеи дается определенное время (устанавливается самостоятельно для каждой группы играющих). \n\n По истечении этого времени слово считается неразгаданным.Один из участников встает напротив других игроков и начинает изображать загаданное слово. Задача остальных назвать это понятие в той форме, в которой оно было задумано. Изображать можно любое определение. \n\n Для детей можно упростить задачу и загадывать только существительные в именительном падеже и единственном числе. Исключение составляют те формы, которые не имеют единственного числа, например: ножницы, часы, брюки. Во время показа нельзя произносить какие-либо звуки, шевелить губами, говорить «да» или «нет» на предположения других игроков.  \n\n Также запрещается показывать руками или рисовать в воздухе буквы, из которых состоит слово. Отгадывающие могут задавать любые уточняющие вопросы, а также перечислять любые варианты, которые приходят на ум. \n\n На разгадку каждой идеи дается определенное время (устанавливается самостоятельно для каждой группы играющих). По истечении этого времени слово считается неразгаданным."
            label.numberOfLines = 0
            label.sizeToFit()
            label.textColor = UIColor.black
            label.translatesAutoresizingMaskIntoConstraints = false
            
            let font = UIFont(name: "Helvetica", size: 20.0)
            let attributes = [NSAttributedString.Key.font: font]
            let attributedString = NSAttributedString(string: label.text ?? "", attributes: attributes as [NSAttributedString.Key : Any])
            label.attributedText = attributedString
            
            return label
        }()
        
        func setupViews(){
            //contentView.backgroundColor = .green
            contentView.addSubview(titleLabel)
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 50),
                titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
            
            
            
            contentView.addSubview(subtitleLabel)
            subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
            subtitleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 9/10).isActive = true
            subtitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
            
        }
        
        setupViews()
        

        button.setBackgroundImage(UIImage(named: "left-arrow"), for: .normal)
        button.backgroundColor = UIColor.clear
        button.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        contentView.addSubview(button)

       
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")

        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        backgroundImage.clipsToBounds = true

                
        self.view.insertSubview(backgroundImage, at: 0)


        
    }
    
}
