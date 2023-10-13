//
//  ColorsListUIVC.swift
//  ColorsApp
//
//  Created by param  on 2023-05-17.
//

import UIKit

class ColorsListUIVC: UIViewController {
    
    // Variables with global scope
    var colorsArr: [UIColor] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Populating the colors array
        addColors()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationUIVC = segue.destination as! ColorDetailUIVC
        destinationUIVC.color = sender as? UIColor
    }
    
}

// Generic Functions Extension
extension ColorsListUIVC{
    
    // Display Toast Message Function
     func showToast(msgText: String){
        if self.view.subviews.count > 1{
            //            do{
            let subviewToast = self.view.subviews[ self.view.subviews.count - 1]
            //                guard let subviewToast = self.view.subviews[1] else {throws exception}
            subviewToast.removeFromSuperview()
            //            }
            //            catch{
            // do nothing
            //            print(self.view.subviews.count)
            //            }
        }
        
        let toastLabel = UILabel(frame: CGRect(x: Int(self.view.frame.width * 0.1), y: Int(self.view.frame.height * 0.86), width: Int(self.view.frame.width) - 70, height: 40))
        
        toastLabel.textAlignment = .center
        toastLabel.backgroundColor = .gray.withAlphaComponent(0.4)
        toastLabel.textColor = .black
        toastLabel.text = msgText
        toastLabel.alpha = 1
        toastLabel.layer.cornerRadius = 10
        toastLabel.clipsToBounds = true
        self.view.addSubview(toastLabel)
        
        UIView.animate(withDuration: 4.0, delay: 1.0, options: UIView.AnimationOptions.curveEaseInOut) {
            toastLabel.alpha = 0.0
        } completion: { isComplete in
            toastLabel.removeFromSuperview()
        }
    }
    
    func addColors(){
        for _ in 0..<50
        {
            colorsArr.append(UIColor.random())
        }
        
    }
}

// Extension for table view components
extension ColorsListUIVC: UITableViewDelegate, UITableViewDataSource{
    // Total no of table row(s)/cell(s) in a table - setup
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return colorsArr.count
    }
    // each table row/cell - setup
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        // Unwrapping optional value returned after getting each cell using dequeueReusableCell() method
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ColorCell") else {
            return UITableViewCell()
        }
        
        // Changing cell properties
        // These will reflect in all cells one by one
        
//        cell.layer.borderWidth = 1
//        cell.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
//        cell.layer.cornerRadius = 10

        cell.backgroundColor = colorsArr[indexPath.row] // row => row number || section => column number
        // Or you can do it this way
        // cell.backgroundColor = colorsArr[indexPath[1]]
        
        return cell
        //         return UITableViewCell()
    }
    
    // table cell/row selection listener
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Toast message appears on first screen where tableview is present
        showToast(msgText: "Button \(indexPath[1])")
        
        // perform/fire segue 
        performSegue(withIdentifier: "ToColorDetailUIVC", sender: colorsArr[indexPath.row])
    }
    
    
}
