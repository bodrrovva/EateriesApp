//
//  EateryDetailViewController.swift
//  EateriesApp
//
//  Created by Student on 19.04.2022.
//

import UIKit

class EateryDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var reatButton: UIButton!
    var rest: Restaurant?
    
    
    //настраиваем кнопку назад(крестик)
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        
    }
    
    //настраиваем навигационную панель
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //настраиваем ячейку(растягивается под размер конента)
        tableView.estimatedRowHeight = 38
        tableView.rowHeight = UITableView.automaticDimension

        imageView.image = UIImage(named: rest!.image)
        
        //настраиваем навигационную панель
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        title = rest!.name
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //количество ячеек
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //количесвто секций в ячейке
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    //создаем и настраиваем ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Ячека cell обращается к ячейкакм класса EateryDetailTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! EateryDetailTableViewCell
        
        switch indexPath.row{
        case 0:
            cell.keyLabel.text = "Название"
            cell.valueLabel.text = rest!.name
        case 1:
            cell.keyLabel.text = "Тип"
            cell.valueLabel.text = rest!.type
        case 2:
            cell.keyLabel.text = "Адерс"
            cell.valueLabel.text = rest!.location
        case 3:
            cell.keyLabel.text = "Я там был?"
            cell.valueLabel.text = rest!.isVisited ? "Да" : "Нет"
        default:
            break
        }
        
        return cell
    }
    
    //анимация выделения 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
