



import UIKit

extension CGContext{
    func setFillColor(_ hex:Int){
        //mask different vlaues of the hex code
        //0xFF0000 -Red
        //0x00FF00 - Green
        //0x0000FF - Blue
        
        let redColor:CGFloat = CGFloat((hex >> 16) & 0xFF) / 255.0
        let greenColor:CGFloat = CGFloat((hex >> 8) & 0xFF) / 255.0
        let blueColor:CGFloat = CGFloat(hex & 0xFF) / 255.0
        
        setFillColor(red: redColor, green: greenColor, blue:blueColor, alpha:1.0)
    }
}

class GraphView: UIView {
    
    let data = calcData.shared
    override func draw(_ rect: CGRect){
        let context:CGContext = UIGraphicsGetCurrentContext()!
        
        let screenHeight = UIScreen.main.bounds.height
        let screenWidth = UIScreen.main.bounds.width
        
        let leftMargin:CGFloat = 16.0
        let rightMargin:CGFloat = screenWidth - 16.0
        
        let topMargin:CGFloat = 80.0
        
        let totalRecHeight = screenHeight - 180.0
        let midPoint = (screenWidth)/2
        
        //draw rectangle
        context.setFillColor(0x84516D)
        
        //context.setFillColor(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        
        
        //draw text
       
        let blackText = [
            NSFontAttributeName: UIFont(name: "Helvetica Bold", size:16.0)!,
            NSForegroundColorAttributeName: UIColor(red:0.0, green:0.0, blue:0.0, alpha:1.0)
        ]
     

        context.setFillColor(0x2DCF09)
        context.fill(CGRect(x:leftMargin, y:topMargin, width:(screenWidth)/2 - 16, height:totalRecHeight))
        
       
        context.setFillColor(0x09ABCF)
        let savePercentHeight = (data.percentSaved/100)*Double(totalRecHeight)
        context.fill(CGRect(x: midPoint, y: 64.0 + leftMargin, width: midPoint - leftMargin, height: CGFloat(savePercentHeight)))
        
        
        let payPercentHeight = Double(totalRecHeight) - savePercentHeight
        
        
        context.setFillColor(0xCF2409)
        context.fill(CGRect(x: midPoint, y: CGFloat(savePercentHeight) + 80.0, width: midPoint - leftMargin, height: CGFloat(payPercentHeight)))
        
        
        
        let priceText = "OG Price"
        let priceTextCoord = CGPoint(x:leftMargin, y:totalRecHeight + leftMargin*6)
        priceText.draw(at: priceTextCoord, withAttributes: blackText)
        
        let priceAmount = "$\(String(format: "%.2f", data.priceWithTax))"
        let priceAmountCoord = CGPoint(x:leftMargin, y:totalRecHeight + leftMargin*7)
        priceAmount.draw(at: priceAmountCoord, withAttributes: blackText)
     
        let paidText = "You Paid"
        let paidTextCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*6)
        paidText.draw(at: paidTextCoord, withAttributes: blackText)
        
        let paidAmount = "$\(String(format: "%.2f", data.priceWithTax - data.savings))"
        let paidAmountCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*7)
        paidAmount.draw(at: paidAmountCoord, withAttributes: blackText)
        
        let paidPercent = "\(String(format: "%.2f", data.percentPaid))%"
        let paidPercentCoord = CGPoint(x: rightMargin - 64, y: totalRecHeight + leftMargin*8)
        paidPercent.draw(at: paidPercentCoord, withAttributes: blackText)
        
        let savingsText = "You Saved"
        let savingsTextCoord = CGPoint(x: midPoint - 32, y: totalRecHeight + leftMargin*6)
        savingsText.draw(at: savingsTextCoord, withAttributes: blackText)
        
        let savingsAmount = "$\(String(format: "%.2f", data.savings))"
        let savingsAmountCoord = CGPoint(x: midPoint - 32 , y: totalRecHeight + leftMargin*7)
        savingsAmount.draw(at: savingsAmountCoord, withAttributes: blackText)
        
        let savingsPercent = "\(String(format: "%.2f", data.percentSaved))%"
        let savingsPercentCoord = CGPoint(x: midPoint - 32, y: totalRecHeight + leftMargin*8)
        savingsPercent.draw(at: savingsPercentCoord, withAttributes: blackText)
      
        
    }
    
}
