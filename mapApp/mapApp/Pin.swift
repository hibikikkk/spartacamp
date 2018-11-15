//
//  Pin.swift
//  mapApp
//
//  Created by 工藤 響 on 2018/10/28.
//  Copyright © 2018 工藤 響. All rights reserved.
//

import UIKit
import MapKit

class Pin: NSObject ,MKAnnotation{
    //位置情報
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    var title:String?
    
    
    
    init(geo:CLLocationCoordinate2D,text: String?){
        coordinate = geo
        title = text
    }
    
    init(dictionary: [String: Any]) {
        if let latitude = dictionary["latitude"] as? Double, let longitude = dictionary["longitude"] as? Double {
            coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }
        
        if let tit = dictionary["title"] as? String {
            title = tit
        }
    }

    func toDictionary() -> [String: Any] {
        var dict: [String: Any] = [:]
        
        dict["latitude"] = coordinate.latitude
        dict["longitude"] = coordinate.longitude
        
        if let tit = title {
            dict["title"] = tit
        }
        
        return dict
    }
    
    
}
