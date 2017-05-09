//
//  CalculatorViewController.swift
//  discountCalculator
//
//  Created by Joshua Marvel on 3/1/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var priceTextbox: UITextField!
    
    @IBOutlet weak var dollarsOffTextbox: UITextField!
    
    @IBOutlet weak var discountTextbox: UITextField!
    
    @IBOutlet weak var otherDiscountTextbox: UITextField!
    
    @IBOutlet weak var taxTextbox: UITextField!
    
    @IBOutlet weak var originalPriceLabel: UILabel!
    
    
    @IBOutlet weak var discountPriceLabel: UILabel!
    
    let discountData = calcData.shared
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //make swip gestures
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Swipe Function
    func handleSwipe(_ sender:UISwipeGestureRecognizer)
    {
        getInput()
        discountData.Calculate()
        displayTotals()
        self.performSegue(withIdentifier: "showResults", sender: self)
    }
    
    //Enable unwinding other views
    @IBAction func unwindToCalc(segue:UIStoryboardSegue){}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    
    private func getInput(){
        
        if (priceTextbox.text == "")
        {
            priceTextbox.text = "0.0"
           discountData.price = Double(priceTextbox.text!)!
        }
        else
        {
            discountData.price = Double(priceTextbox.text!)!
        }
        
        if (dollarsOffTextbox.text == "")
        {
            dollarsOffTextbox.text = "0.0"
            discountData.dollarsOff = Double(dollarsOffTextbox.text!)!
        }
        else
        {
            discountData.dollarsOff = Double(dollarsOffTextbox.text!)!
        }
        
        if (discountTextbox.text == "")
        {
            discountTextbox.text = "0.0"
            discountData.discount = Double(discountTextbox.text!)!
        }
        else
        {
            discountData.discount = Double(discountTextbox.text!)!
        }
        
        if (otherDiscountTextbox.text == "")
        {
            otherDiscountTextbox.text = "0.0"
            discountData.otherDiscount = Double(otherDiscountTextbox.text!)!
        }
        else
        {
            discountData.otherDiscount = Double(otherDiscountTextbox.text!)!
        }
        
        if (taxTextbox.text == "")
        {
            taxTextbox.text = "0.0"
            discountData.tax = Double(taxTextbox.text!)!
            
        }
        else
        {
            discountData.tax = Double(taxTextbox.text!)!
        }
        
      
    }
    
   
    
    
    @IBAction func CalcButton(_ sender: UIButton) {
        
        getInput()
         discountData.Calculate()
        displayTotals()
        //self.performSegue(withIdentifier: "showResults", sender: self)
        
    }
    
    func displayTotals()
    {
        originalPriceLabel.text = "Original Price $ \(String(format: "%.2f", discountData.priceWithTax))"
        
        discountPriceLabel.text = "Discounted Price $ \(String(format: "%.2f", discountData.discountedPrice))"
        
    }
    
    
    
    

}
