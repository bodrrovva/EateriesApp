//
//  EateriesTableViewController.swift
//  EateriesApp
//
//  Created by Student on 18.04.2022.
//

import UIKit

class Eateries: UITableViewController {
    
    //заглушка с данными(потом будет api)
    var rest: [Restaurant] = [
    Restaurant(name: "Ogonek Grill&Bar", location: "Уфа, бульвар Хадии Давлетшиной 21, вход со стороны улицы", type: "Ресторан", image: "ogonek.jpg", isVisited: false),
    Restaurant(name: "Елу", location: "Уфа", type: "Ресторан", image: "elu.jpg", isVisited: false),
    Restaurant(name: "Bonsai", location: "Уфа", type: "Ресторан", image: "bonsai.jpg", isVisited: false),
    Restaurant(name: "Дастархан", location: "Уфа", type: "Ресторан", image: "dastarhan.jpg", isVisited: false),
    Restaurant(name: "Индокитай", location: "Уфа", type: "Ресторан", image: "indokitay.jpg", isVisited: false),
    Restaurant(name: "X.O", location: "Уфа", type: "Ресторан", image: "x.o.jpg", isVisited: false),
    Restaurant(name: "Балкан Гриль", location: "Уфа", type: "Ресторан", image: "balkan.jpg", isVisited: false),
    Restaurant(name: "Respublica", location: "Уфа", type: "Ресторан", image: "respublika.jpg", isVisited: false),
    Restaurant(name: "Speak Easy", location: "Уфа", type: "Ресторан", image: "speakeasy.jpg", isVisited: false),
    Restaurant(name: "Morris Pub", location: "Уфа", type: "Ресторан", image: "morris.jpg", isVisited: false),
    Restaurant(name: "Вкусные истории", location: "Уфа", type: "Ресторан", image: "istorii.jpg", isVisited: false),
    Restaurant(name: "Классик", location: "Уфа", type: "Ресторан", image: "klassik.jpg", isVisited: false),
    Restaurant(name: "Love&Life", location: "Уфа", type: "Ресторан", image: "love.jpg", isVisited: false),
    Restaurant(name: "Шок", location: "Уфа", type: "Ресторан", image: "shok.jpg", isVisited: false),
    Restaurant(name: "Бочка", location: "Уфа", type: "Ресторан", image: "bochka.jpg", isVisited: false)
    ]

    
    //настраиваем навигационную панель
    override func viewWillAppear(_ animated: Bool) {
        //панель убирается при скролле
        navigationController?.hidesBarsOnSwipe = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //размер ячейки(растягивается под размер контента)
        tableView.estimatedRowHeight = 85
        tableView.rowHeight = UITableView.automaticDimension
        
        //настраиваем навигационную панель
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    //количество секций
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    //количество рядов в секции
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return rest.count
    }
    
    //метод создает ячейку
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesCell
        
        cell.nameLabel.text = rest[indexPath.row].name
        cell.locationLabel.text = rest[indexPath.row].location
        cell.typeLabel.text = rest[indexPath.row].type
        
        cell.thumbnailImageView.image = UIImage(named: rest[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        
        cell.accessoryType = self.rest[indexPath.row].isVisited ? .checkmark: .none
        
        return cell
    }

    //Дополнительные действия по свайпу
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        //Поедлиться
        let share = UITableViewRowAction(style: .default, title: "Поделиться") { (action, indexPath) in

            let defaultText = "Я сейчас в " + self.rest[indexPath.row].name
            if let image = UIImage(named: self.rest[indexPath.row].image){
                let activityController = UIActivityViewController(activityItems: [defaultText, image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }

        //Удалить
        let delete = UITableViewRowAction(style: .default, title: "Удалить"){(action, indexPath) in
        self.rest.remove(at: indexPath.row)
        //анимация удаления
        tableView.deleteRows(at: [indexPath], with: .fade)
        }

        share.backgroundColor = .systemTeal
        delete.backgroundColor = .systemRed
        return[delete,share]
    }
    //настраиваем переход(передаем данные на другую view)
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailSegue" {
            if let indexPath = tableView.indexPathForSelectedRow {
                //destination view controller - конечная точка
                //обращаемся к классу EateryDetailViewController
                let dvc = segue.destination as! EateryDetail
                dvc.rest = self.rest[indexPath.row]
            }
        }
    }
}


