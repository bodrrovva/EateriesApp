//
//  RateViewController.swift
//  EateriesApp
//
//  Created by Student on 20.04.2022.
//

import UIKit

class Rate: UIViewController {
    
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var badButton: UIButton!
    var restRaiting: String?
    var color: UIColor?
    
    //
    @IBAction func rateRest(sender: UIButton){
        //в зависимости от тега кнопки присваеваем значение
        switch sender.tag{
        case 1:
            restRaiting = "hand.thumbsup.fill"
            color = UIColor(named: "Green")
        case 2:
            restRaiting = "hand.thumbsdown.fill"
            color = UIColor(named: "Red")
        default: break
        }
        //принудительный переход назад
        performSegue(withIdentifier: "unwindSegueDVC", sender: sender)
    }

    //анимация кнопок
    override func viewDidAppear(_ animated: Bool) {
        let buttonArray = [badButton, goodButton]
        for (index, button) in buttonArray.enumerated(){
            //появление кнопок с задержкой
            let delay = Double(index) * 0.2
            //Настройка анимации
            UIView.animate(withDuration: 0.3, delay: delay,usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut,animations: {
                button?.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //начальная позиция ratingStackView
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
    


}
