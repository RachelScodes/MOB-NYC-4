//
//  ViewController.swift
//  UnitConverter
//
//  Created by William Martin on 5/21/15.
//  Copyright (c) 2015 Anomalus. All rights reserved.
//

import UIKit


/*
This is an "enumaration." It's a way to hold tag-like data in a readable way.

They're good for holding things like modes, options, tags, etc. They're treated
like a type, but implemented (by default) as Integers. So variables can contain
a value of type "ConversionMode," and those values are .ImperialToMetric and
.MetricToImperial.

Note the leading dot! It's Swift's shorthand so we don't have to type 
"ConversionMode.ImperialToMetric" all the time. For example:

    var mode : ConversionMode = .ImperialToMetric
*/
enum ConversionMode {
    case ImperialToMetric
    case MetricToImperial
}


class ViewController: UIViewController {
    
    // MARK: - App state
    
    // Keeps track of the value the user types.
    var _inputValue : String = ""
    
    var inputValue : String {
        get {
            return self._inputValue
        }
        
        set {
            self._inputValue = newValue
            // Call a method to update the UILabel
        }
    }
    
    // This variable helps enable the behavior of after a conversion is
    // made, when the user taps on a number or dot, to clear the input
    // value. We're assuming the user wants to type a different number.
    var shouldClearInputValue : Bool = true
    
    // Hold a piece of state that determines whether the app is currently
    // intended to convert imperial to metric units, or vice versa.
    var currentMode : ConversionMode = .ImperialToMetric
    
    // ----------------------------------------------------------------------------
    // MARK: - The input and output labels and units.
    
    // Reference the labels necessary to display values.
    @IBOutlet weak var inputValueLabel: UILabel!
    @IBOutlet weak var outputValueLabel: UILabel!
    
    @IBOutlet weak var inputUnitsLabel: UILabel!
    @IBOutlet weak var outputUnitsLabel: UILabel!
    
    
    // This action is called when a user taps a digit 0-9, dot, or C.
    @IBAction func onButtonPressed(sender:UIButton) {
        // Get the text label from the UIButton
        let buttonText = sender.titleLabel!.text!
        
        // if C:
        //     Clear the input value
        // if 0-9 or the dot:
        //     Add it to the "input value"
        // if -:
        //     Negate the current value.

        if buttonText == "C" {
            // Clear the input value
            self.clearInputValue()
            
        } else if buttonText == "-" {
            // So, we could manipulate the string inputValue by checking for 
            // a leading - sign, but it's easier to just convert it to a Double,
            // negate it, and convert it back to a String.
            
            let negatedInputValue = -self.valueToConvert
            
            // Clear the input/output labels to make the output value reset.
            
            // If the desired behavior were to automatically update the output
            // value as well, we'd have to know what conversion was active.
            
            // This does force the user to tap the conversion again, however,
            // which is probably not ideal from a UX perspective.
            self.clearInputValue()
            
            // Set the input value as the negation of the original.
            self.inputValue = "\(negatedInputValue)"
            
        } else {
            // This clause handles dots and digits.
            if self.shouldClearInputValue {
                self.clearInputValue()
                self.shouldClearInputValue = false
            }
            
            // Append the digit to the end of the input value
            self.appendNewDigit(buttonText)
        }
        
        // Update the input value's UILabel
        self.inputValueLabel.text = self.inputValue
    }
    
    func clearInputValue() {
        self.inputValue = ""
        self.outputValueLabel.text = ""
    }
    
    func appendNewDigit(digit:String) {
        self.inputValue += digit
    }
    
    // ----------------------------------------------------------------------------
    // MARK: - Toggling the conversion mode.
    
    
    // Reference to all the buttons are required as we're going to enable a Swap
    // button that changes the direction of the conversion (metric-to-imperial or 
    // imperial-to-metric).
    
    @IBOutlet weak var buttonFtoC: UIButton!
    @IBOutlet weak var buttonMiToKm: UIButton!
    @IBOutlet weak var buttonLbsToKg: UIButton!
    @IBOutlet weak var buttonInToCm: UIButton!
    @IBOutlet weak var buttonFtToM: UIButton!
    @IBOutlet weak var buttonGaToLi: UIButton!
    
    
    // This IBAction handles the case in which the user is toggling the conversion
    // mode between imperial-to-metric and metric-to-imperial.
    @IBAction func swapConversionMode(sender: AnyObject) {
        if self.currentMode == .ImperialToMetric {
            self.currentMode = .MetricToImperial
        } else {
            self.currentMode = .ImperialToMetric
        }
        
        // Once the mode is swapped, we should update all the buttons to reflect
        // the change. Thus, "F to C" should change to "C to F", and vice versa.
        self.updateButtonsOnConversionModeChange()
        self.updateInputOutputValuesOnConversionModeChange()
    }
    
    // Use a property to keep track of all the buttons and their corresponding
    // converters with a Dictionary from String to Tuple of Conversion + UIButton.
    
    // Tuples are parentheses-delimited, comma-separated lists that are strongly 
    // typed against their individual elements.
    var converters : [String: (Conversion, UIButton)] {
        return [
            "FtoC" : (FahrenheitToCelsius(), self.buttonFtoC),
            "MiToKm" : (MilesToKilometers(), self.buttonMiToKm),
            "LbsToKg" : (PoundsToKilograms(), self.buttonLbsToKg),
            "InToCm" : (InchesToCentimeters(), self.buttonInToCm),
            "FtToM" : (FeetToMeters(), self.buttonFtToM),
            "GaToLi" : (GallonsToLiters(), self.buttonGaToLi)
        ]
    }

    
    // Changes all the text in all the conversion buttons given the current conversion mode.
    func updateButtonsOnConversionModeChange() {
        var inputUnits : String = ""
        var outputUnits : String = ""
        
        // Loop over the converters property. Note how we can "unpack" the tuple of 
        // (Conversion, UIButton) by using a tuple syntax with two variables of our choosing:
        for (_, (converter, button)) in self.converters {
            
            if self.currentMode == .ImperialToMetric {
                inputUnits = converter.imperialUnits
                outputUnits = converter.metricUnits
            } else {
                inputUnits = converter.metricUnits
                outputUnits = converter.imperialUnits
            }
            
            let newButtonTitle = "\(inputUnits) to \(outputUnits)"

            // Note that we have to set the title of the button through the UIButton's
            // method "setTitle." It's not a good idea to update the UILabel contained
            // in the button.
            button.setTitle(newButtonTitle, forState: .Normal)

        }
    }
    
    // Swaps the displayed units and values.
    func updateInputOutputValuesOnConversionModeChange() {
        // Swap the values by reading them first...
        let currentInput = self.inputValueLabel.text
        let currentOutput = self.outputValueLabel.text
        
        // ... and setting a given value to the *other* label.
        self.inputValueLabel.text = currentOutput
        self.outputValueLabel.text = currentInput

        // If we're swapping, take what was the outputValue and make it the new input,
        // in case the user taps another conversion button.
        self.inputValue = currentOutput!
        
        // Swap the units as well.
        let currentInputUnits = self.inputUnitsLabel.text
        let currentOutputUnits = self.outputUnitsLabel.text
        
        self.inputUnitsLabel.text = currentOutputUnits
        self.outputUnitsLabel.text = currentInputUnits
        
        // If the user swaps, ensure the next digit clears the input.
        self.shouldClearInputValue = true
    }

    
    // ----------------------------------------------------------------------------
    // MARK: - Conversion event handlers.
    
    // These IBActions handle the conversion buttons.
    
    @IBAction func convertFtoC(sender: AnyObject) {
        self.convertAndDisplay(FahrenheitToCelsius())
    }
    
    @IBAction func convertMiToKm(sender: AnyObject) {
        self.convertAndDisplay(MilesToKilometers())
    }
    
    @IBAction func convertLbsToKg(sender: AnyObject) {
        self.convertAndDisplay(PoundsToKilograms())
    }
    
    @IBAction func convertInToCm(sender: AnyObject) {
        self.convertAndDisplay(InchesToCentimeters())
    }
    
    @IBAction func convertFtToM(sender: AnyObject) {
        self.convertAndDisplay(FeetToMeters())
    }
    
    @IBAction func convertGaToLi(sender: AnyObject) {
        self.convertAndDisplay(GallonsToLiters())
    }
    

    // Convert the input value and display that result (the output
    // value) in the appropriate label.
    func convertAndDisplay(converter:Conversion) {
        
        // Compute the output value, which now depends on our conversion mode.
        var outputValue = 0.0
        if self.currentMode == .ImperialToMetric {
            outputValue = converter.convertImperialToMetric(self.valueToConvert)
        } else {
            outputValue = converter.convertMetricToImperial(self.valueToConvert)
        }
        
        // Perform the appropriate UI updates.
        self.updateOutputDisplay(outputValue)
        self.updateUnits(converter)
        
        // Ensure that on the next tap of a digit or dot, that the
        // input value is reset. Again, the desired behavior is that
        // the user is expected to be typing a new number.
        self.shouldClearInputValue = true
    }
    
    // A "computed property" that returns the value the user has typed, but as a Double 
    // instead of a String. We can use this property anywhere in this class
    // (i.e. self.valueToConvert).
    var valueToConvert : Double {
        // Get the inputValue and convert to a Double. We have to use NSString's
        // conversion methods. Note that this isn't 100% fool-proof, in that
        // an invalid inputValue (e.g. "12.2.3.0000") will still have a valid
        // .doubleValue of 0.0.
        return NSString(string:self.inputValue).doubleValue
    }
    
    // Takes an output value and updates the label.
    func updateOutputDisplay(outputValue:Double) {
        let outputWithDecimalFormatting = NSString(format: "%.3f", outputValue) as String
        self.outputValueLabel.text = outputWithDecimalFormatting
    }
    
    // Takes a given conversion and updates the units displayed in the UI given
    // the units contained in the conversion.
    func updateUnits(converter:Conversion) {
        // Update the input and output units labels.
        
        if self.currentMode == .ImperialToMetric {
            self.inputUnitsLabel.text = converter.imperialUnits
            self.outputUnitsLabel.text = converter.metricUnits
        } else {
            self.inputUnitsLabel.text = converter.metricUnits
            self.outputUnitsLabel.text = converter.imperialUnits
        }
    }

    // ----------------------------------------------------------------------------
    // MARK: - View controller event handlers.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

