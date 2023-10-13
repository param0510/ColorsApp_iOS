//
//  ColorDetailUIVC.swift
//  ColorsApp
//
//  Created by param  on 2023-05-17.
//

import UIKit

class ColorDetailUIVC: UIViewController {
    
    var color: UIColor?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // setting up the background color on receiving values from previous view
        view.backgroundColor = color ?? UIColor.clear
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
