//
//  TrackPickerViewV2.swift
//  AndresApp
//
//  Created by Andres Calizaya on 01/12/2021.
//
//protocol TracksPickerDelegate {
//    func addTrack (addedTrack:Track)
//}

import UIKit
protocol TracksPickerDelegate {
    func addTrack (addedTrack:Track)
}

class TrackPickerView: UIPickerView {
    var mydelegate:TracksPickerDelegate?
    let myUIPicker: UIPickerView = UIPickerView()

}
extension TrackPickerView: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return misTracks.count
    }
        
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let rowStr = misTracks[row]
        return rowStr.title
        
    }
    
}
