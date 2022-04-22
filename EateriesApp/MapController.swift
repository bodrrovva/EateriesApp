//
//  MapController.swift
//  EateriesApp
//
//  Created by Student on 22.04.2022.
//

import UIKit
import MapKit

class MapController: UIViewController,MKMapViewDelegate {
    //экземпляр структуры Restaurant
    var rest: Restaurant!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //класс будет реализовавывать методы делигата mapView
        mapView.delegate = self
        
        //переменная преобразует текст в широту и долготу
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(rest.location) { (placemarks, error) in
            
            //проверяем на ошибки
            guard error == nil else { return }
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first!
            
            //анотация
            let annotation = MKPointAnnotation()
            annotation.title = self.rest.name
            annotation.subtitle =  self.rest.type
            
            guard let location = placemark.location else { return }
            annotation.coordinate = location.coordinate
            
            //отображнеие аннотации + анимация
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
            
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        //совпадает ли адрес с текущим местоположением пользователя
        guard !(annotation is MKUserLocation) else { return nil }
        
        //создаем идентификатор
        let annotationIdentifier = "restAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) as? MKPinAnnotationView
        
        //проверяем на получилось ли создать идентификатор, если нет создаем вручную
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            //позволяет отображать доп инфу(ниже картинка)
            annotationView?.canShowCallout = true
        }
        
        //картинка справа в аннотации
        let rightImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        rightImage.image = UIImage(named: rest.image)
        annotationView?.rightCalloutAccessoryView = rightImage
        
        //цвет занчка местоположения
        annotationView?.pinTintColor = UIColor(named: "Green")
        
        return annotationView
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
