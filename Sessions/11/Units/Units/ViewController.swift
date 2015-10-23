//
//  ViewController.swift
//  Units
//
//  Created by William Martin on 10/21/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

// We're using a UIPickerView, which requires two protocols, one for a delegate, another for a data
// source, just like a table view.
//
class ViewController: UIViewController,
    UIPickerViewDelegate,
    UIPickerViewDataSource
{
    // References to the two values displayed in the view.
    @IBOutlet weak var inputLabel: UILabel!
    @IBOutlet weak var outputLabel: UILabel!

    
    // ------------------------------------------------------------------------
    // MARK: - UIPickerView stuff
    
    // List all the available conversions here.
    let conversions = [
        FtoC(),
        FeetToMeters(),
        MilesToKilometers()
    ]
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        // A "Component" is just a column in the picker view. We only have one column.
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        // All we need to do here is return the number of conversions. This tells the UIPickerView
        // how many options will appear in the view.
        return self.conversions.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // Use the given row integer to select a Conversion instance from our available conversions.
        let conversion = self.conversions[row]
        
        // Return the user-friendly String to show the user.
        return conversion.userFriendlyDescription()
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // Once the user selects a row, set the currentConversion property to the conversion
        // associated with the selected row.
        self.currentConversion = self.conversions[row]
        
        // Then convert the current input to provide a smooth user experience.
        self.computeConversion()
    }
    
    // ------------------------------------------------------------------------
    // MARK: - View controller events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Select the first available Conversion as the default.
        self.currentConversion = self.conversions[0]
        
        // Go ahead and compute just so the values make sense when we start the app.
        self.computeConversion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // ------------------------------------------------------------------------
    // MARK: - Interaction
    
    @IBAction func onButtonTapped(sender:UIButton) {
        print(sender.tag)
        
        // We've set a "tag" on the buttons 1 through 9 equal to the numbers they
        // represent. E.g. Button with "1" has tag == 1.
        if 1 <= sender.tag && sender.tag <= 9 {
            self.userTappedDigit(sender.tag)
            
        } else if sender.tag == 10 {
            // Clear button!
            self.userTappedClear()
            
        } else if sender.tag == 11 {
            // Zero button!
            self.userTappedDigit(0)
            
        } else if sender.tag == 12 {
            // Dot button!
            self.userTappedDot()
            
        }
    }
    
    // Hold the actual input the user has typed.
    var input : String = ""
    
    // Call this method when a user taps 0, 1, 2, 3, 4, 5, 6, 7, 8, 9.
    func userTappedDigit(digit:Int) {
        self.input += String(digit)
        self.update()
    }
    
    // Call this when a user taps the "C" button.
    func userTappedClear() {
        self.input = ""
        self.update()
    }
    
    // Call this when a user taps the dot button.
    func userTappedDot() {
        self.input += "."
        self.update()
    }
    
    
    // This method handles updating the user interface when the user interacts with the 
    // app's keypad.
    func update() {
        // Update the input, since the user is typing.
        self.updateInputLabel()
        
        // Compute here on every button tap to enable our As-You-Type experience.
        self.computeConversion()
    }
    
    // Updates the label showing the user's input.
    func updateInputLabel() {
        if self.input == "" {
            // If the user taps "Clear", we have an empty String as self.input.
            // We want this to show as "0.0".
            self.inputLabel.text = "0.0"
            
        } else {
            // Otherwise, just show the value the user is inputting.
            self.inputLabel.text = self.input
            
        }
    }
    
    // Updates the label showing the output given a Double.
    func updateOutputLabel(value:Double) {
        // String(value) takes the given value and converts it to a String so we can hand it
        // over to the UILabel.
        self.outputLabel.text = String(value)
    }
    
    // Hold the conversion the user has selected here. Start with FtoC() as a default.
    var currentConversion : Conversion!
    
    func computeConversion() {
        // Hold the value we want to convert here as a variable, and we'll set it to the user's
        // input if the user has entered a valid value.
        var valueToBeConverted = 0.0
        
        // Convert the current input into a Double, but check for the nil value if we happen to
        // get a value that isn't convertable to a String.
        if let inputValue = Double(self.input) {
            // Here, the value is valid (i.e. the user didn't type something weird, like 3 dots).
            // So set the valueToBeConverted property to the value the user entered.
            valueToBeConverted = inputValue
        }
        
            
        // Call the convert() method on the current conversion to actually perform the conversion.
        let convertedValue = self.currentConversion.convert(valueToBeConverted)
        
        // Update the user with the new value.
        self.updateOutputLabel(convertedValue)

    }
    
}


















