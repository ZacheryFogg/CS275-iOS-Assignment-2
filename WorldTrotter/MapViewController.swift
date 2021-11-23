//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Zach Fogg on 10/12/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    let zachsHome = CLLocation(latitude: 43.985854, longitude: -72.153931)
    let regionRadius: CLLocationDistance = 1000
    
    
    override func loadView() {
        // Create the map view and then set it as the VCs view
        mapView = MKMapView()
        view = mapView
        
        // Create Segmented Control
        let segmentedControl = UISegmentedControl(items : ["Standard" , "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        // Constrain Segmented Control
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        segmentedControl.addTarget(self, action: #selector(mapTypeChanged(_:)), for: .valueChanged)
        
        // Create Points of Interest Switch - I put the switch and label in a stack view and then contrained the stack view
        // Set spacing in stack view to 12 points. This meets the requirements you outlined but in a stack view, which seems cleaner
        let poiSwitch = UISwitch()
        let pntsInterestLabel = UILabel()
        pntsInterestLabel.text = "Points of Interest"
        pntsInterestLabel.font = pntsInterestLabel.font.withSize(20)
        poiSwitch.setOn(true, animated: false)
        
        let switchArray = [pntsInterestLabel, poiSwitch]
        let pntsInterestStackView = UIStackView(arrangedSubviews: switchArray)
        
        pntsInterestStackView.axis = .horizontal
        pntsInterestStackView.alignment = .fill
        pntsInterestStackView.spacing = 12
        pntsInterestStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pntsInterestStackView)
        
        // Constrain Stack View for POI Switch
        let stackViewTopConstraint = pntsInterestStackView.topAnchor.constraint(equalTo: segmentedControl.safeAreaLayoutGuide.bottomAnchor, constant: 8)
        let stackViewLeadingConstraint = pntsInterestStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)

        stackViewTopConstraint.isActive = true
        stackViewLeadingConstraint.isActive = true
        
        poiSwitch.addTarget(self, action: #selector(poiDisplay(_:)), for: .valueChanged)
        
        // Create 'Find Me' Button
        let fndMeButton = UIButton()
        fndMeButton.setTitle("Find Me", for: .normal)
        fndMeButton.setTitleColor(.purple, for: .normal)
        fndMeButton.backgroundColor = .white
        fndMeButton.addTarget(self, action: #selector(fndMeButtonHandler), for: .touchUpInside)
        fndMeButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(fndMeButton)
        
        // Constrain 'Find Me' Button
        let fndMeButtonTopConstraint = fndMeButton.topAnchor.constraint(equalTo: pntsInterestStackView.safeAreaLayoutGuide.bottomAnchor, constant: 8)

        let fndMeButtonLeadingConstraint = fndMeButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor)
        let fndMeButtonWidthConstrainst = fndMeButton.widthAnchor.constraint(equalToConstant: fndMeButton.titleLabel!.intrinsicContentSize.width + 5.0 * 3)
        fndMeButtonTopConstraint.isActive = true
        fndMeButtonLeadingConstraint.isActive = true
        fndMeButtonWidthConstrainst.isActive = true
        fndMeButton.layer.borderWidth = 1
        fndMeButton.layer.cornerRadius = 2
        
        
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .hybrid
        case 2:
            mapView.mapType = .satellite
        default:
            break
        }
    }
    
    // Function to zoom into zach's location
    @objc func fndMeButtonHandler(sender: UIButton!) {
        
        func centerMapOnLocation(location: CLLocation)
        {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
            mapView.setRegion(coordinateRegion, animated: true)
        }
        centerMapOnLocation(location: zachsHome)
    }
    
    
    
    @objc func poiDisplay(_ pntInterestSwitch: UISwitch) {
        if pntInterestSwitch.isOn {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.includingAll
        } else {
            mapView.pointOfInterestFilter = MKPointOfInterestFilter.excludingAll
        }
    }
}
