//
//  calcData.swift
//  discountCalculator
//
//  Created by Joshua Marvel on 3/13/17.
//  Copyright © 2017 Joshua Marvel. All rights reserved.
//

import UIKit

class calcData {
    
    
    var price: Double
    var dollarsOff: Double
    var discount: Double
    var otherDiscount: Double
    var tax: Double
    var discountedPrice: Double
    var priceBeforeDiscount: Double
    var priceWithTax: Double
    var savings: Double
    var percentSaved: Double
    var percentPaid: Double
    
    
    private init(_ price: Double, _ dollarsOff: Double, _ discount: Double, _ otherDiscount: Double, _ tax: Double, _ discountedPrice: Double, _ priceBeforeDiscount: Double, _ priceWithTax: Double, _ savings: Double, _ percentSaved: Double, _ percentPaid: Double){
        
        self.price = price
        self.dollarsOff = dollarsOff
        self.discount = discount
        self.otherDiscount = otherDiscount
        self.tax = tax
        self.discountedPrice = discountedPrice
        self.priceBeforeDiscount = priceBeforeDiscount
        self.priceWithTax = priceWithTax
        self.savings = savings
        self.percentSaved = percentSaved
        self.percentPaid = percentPaid
        
    }
    
        
    static let shared: calcData = calcData(0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    
    func Calculate(){
        
        savings = priceWithTax - discountedPrice
        discountedPrice = (1 - (discount + otherDiscount)/100)*price - dollarsOff + (tax/100)*price
        priceWithTax = price + (price*tax)/100
        percentPaid = 100 - percentSaved
        percentSaved = (savings/priceWithTax)*100
        
    }
    
    
}


