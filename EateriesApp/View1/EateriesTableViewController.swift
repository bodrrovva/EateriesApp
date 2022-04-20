//
//  EateriesTableViewController.swift
//  EateriesApp
//
//  Created by Student on 18.04.2022.
//

import UIKit

class EateriesTableViewController: UITableViewController {
    
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
        
        //navigationController?.navigationBar.barStyle = UIBarStyle.default
            //галочка назад
//        navigationController?.navigationBar.tintColor = .white
//        navigationController?.navigationBar.backgroundColor = UIColor.green
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateriesTableViewCell
        
        cell.nameLabel.text = rest[indexPath.row].name
        cell.locationLabel.text = rest[indexPath.row].location
        cell.typeLabel.text = rest[indexPath.row].type
        
        cell.thumbnailImageView.image = UIImage(named: rest[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 32.5
        
        cell.accessoryType = self.rest[indexPath.row].isVisited ? .checkmark: .none
        
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        //настраиваем высплывающие окна
//        let ac = UIAlertController(title: nil, message: "Выберите действие", preferredStyle: .actionSheet)
//        //1 действие
//        let call = UIAlertAction(title: "Позвонить: +7(999)999-9\(indexPath.row)", style: .default) {
//            //создаем еще один алерт внутри основного алерта
//            (action: UIAlertAction) -> Void in
//
//            let alertC = UIAlertController(title: nil, message: "Вызов не может быть совершен", preferredStyle: .alert)
//            let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
//            alertC.addAction(ok)
//            self.present(alertC, animated: true, completion: nil)
//        }
//        //2 действие
//        let isVisitedTitle = self.rest[indexPath.row].isVisited ? "Я не был здесь" : "Я был здесь"
//        let isVisited = UIAlertAction(title: isVisitedTitle, style: .default){ (action) in
//            let cell = tableView.cellForRow(at: indexPath)
//            //галочка
//            self.rest[indexPath.row].isVisited = !self.rest[indexPath.row].isVisited
//            cell?.accessoryType = self.rest[indexPath.row].isVisited ? .checkmark: .none
//        }
//        //3 действие
//        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
//
//        ac.addAction(call)
//        ac.addAction(isVisited)
//        ac.addAction(cancel)
//
//        present(ac, animated: true, completion: nil)
//
//        tableView.deselectRow(at: indexPath, animated: true)
//    }


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
                let dvc = segue.destination as! EateryDetailViewController
                dvc.rest = self.rest[indexPath.row]
            }
        }
    }
}


