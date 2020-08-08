//
//  CustomLocationManager.swift
//
//  Created by Vishal Gupta on 08/08/20.
//  Copyright © 2020 VishalGuptahmh. All rights reserved.
//

/*
 Useage:
 
 class MyViewController: UIViewController{
 
   let mCustomLocationManger=CustomLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        mCustomLocationManger.customDeligate=self
    }
    
    @IBAction func btnLocation(_ sender: UIButton) {
        mCustomLocationManger.getLocation()
    }
 }

 extension MyViewController: CustomLocationManagerDeligate {
     
     func didUpdateLocation(_ latitude: Double, _ logitude: Double) {
         wm.fetchData(latitude: latitude, longitude: logitude)
     }
     
     func didErrorOccuredLocation(error: Error?) {
         print("error occured")
     }
 }
 
 */

import CoreLocation
import Foundation

class CustomLocationManager:NSObject,CLLocationManagerDelegate {
    let locationManager=CLLocationManager()

    var lat:Double?
    var lon:Double?
    
    var customDeligate:CustomLocationManagerDeligate?
    
    override init() {
        super.init()
        locationManager.delegate=self
    }
   func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
       print("getlocation")
       if let location=locations.last{
           locationManager.stopUpdatingLocation()
            lat=location.coordinate.latitude
            lon=location.coordinate.longitude
            print("lat:\(lat!)  long : \(lon!)")
            customDeligate?.didUpdateLocation(lat!,lon!)
       }
   }
   
   func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
    print(error)
    customDeligate?.didErrorOccuredLocation(error: error)
   }
    
    func getLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
}

protocol CustomLocationManagerDeligate {
    func didUpdateLocation(_ latitude:Double,_ logitude:Double)
    func didErrorOccuredLocation(error:Error?)
    
}
