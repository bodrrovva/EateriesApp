//
//  EateryDetailViewController.swift
//  EateriesApp
//
//  Created by Student on 19.04.2022.
//

import UIKit

class DetailController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    var rest: Restaurant?
    @IBOutlet weak var mapButton: UIButton!
    
    
    //настраиваем переход
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        //передаем оценку с экрана RateViewController
        guard let svc = segue.source as? RateController else { return }
        guard let rating = svc.restRaiting else { return }
        guard let color = svc.color else { return }
        rateButton.setImage(UIImage(systemName: rating), for: .normal)
        rateButton.tintColor = color
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! DetailCell
        
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
    
    //анимация выделения при нажатии на элемент в таблице
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //передаем данные в MapController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue" {
            let dvc = segue.destination as! MapController
            dvc.rest = self.rest
        }
    }

}
