//
//  HomeViewController.swift
//  Meetup
//
//  Created by Iliyan Kupenov on 3/21/17.
//  Copyright © 2017 Iliyan Kupenov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var locationService: LocationServiceProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currLocation = locationService.getCurrentLocation()
        print(currLocation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
