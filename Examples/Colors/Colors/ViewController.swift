//
//  ViewController.swift
//  Colors
//
//  Created by William Martin on 10/5/15.
//  Copyright © 2015 Anomalus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var savedColorView: UIView!
    
    @IBOutlet weak var hueLabel: UILabel!
    @IBOutlet weak var brightnessLabel: UILabel!
    @IBOutlet weak var saturationLabel: UILabel!

    
    @IBOutlet weak var hueSlider: UISlider!
    @IBOutlet weak var brightnessSlider: UISlider!
    @IBOutlet weak var saturationSlider: UISlider!
    
    
    var hue : Float = 0.5
    var brightness : Float = 0.5
    var saturation : Float = 0.5
    
    var savedHue : Float = 0.5
    var savedBrightness : Float = 0.5
    var savedSaturation : Float = 0.5
    
    @IBAction func onHueChanged(sender: UISlider) {
        self.hue = sender.value
        self.updateSliderLabels()
        self.updateColor()
    }

    @IBAction func onBrightnessChanged(sender: UISlider) {
        self.brightness = sender.value
        self.updateSliderLabels()
        self.updateColor()
    }
    
    @IBAction func onSaturationChanged(sender: UISlider) {
        self.saturation = sender.value
        self.updateSliderLabels()
        self.updateColor()
    }
    
    func updateColor() {
        // Construct a new UIColor instance from the properties hue, brightness, and saturation.
        // Type UIColor( <ESC> and click the hue: ... initializer.
        let newColor = UIColor(
            hue: CGFloat(self.hue),
            saturation: CGFloat(self.saturation),
            brightness: CGFloat(self.brightness),
            alpha: 1.0
        )
        
        // This changes the color of the rectangle in the app.
        self.colorView.backgroundColor = newColor
        
    }
    

    @IBAction func onSaveTapped(sender: UIButton) {
        self.savedHue = self.hue
        self.savedBrightness = self.brightness
        self.savedSaturation = self.saturation
        
        self.updateSavedColor()
    }
    
    @IBAction func onMixTapped(sender: UIButton) {
        self.hue = (self.hue + self.savedHue) / 2.0
        self.brightness = (self.brightness + self.savedBrightness) / 2.0
        self.saturation = (self.saturation + self.savedSaturation) / 2.0
        self.updateColor()
        self.updateSliders()
    }

    
    // Moves the sliders to match the color in the upper rectangle.
    func updateSliders() {
        self.hueSlider.value = self.hue
        self.brightnessSlider.value = self.brightness
        self.saturationSlider.value = self.saturation
        self.updateSliderLabels()
    }
    
    // Updates all the labels for all the sliders at once.
    func updateSliderLabels() {
        self.hueLabel.text = "Hue: \(self.hue)"
        self.brightnessLabel.text = "Brightness: \(self.brightness)"
        self.saturationLabel.text = "Saturation: \(self.saturation)"
    }
    
    func updateSavedColor() {
        let newColor = UIColor(
            hue: CGFloat(self.savedHue),
            saturation: CGFloat(self.savedBrightness),
            brightness: CGFloat(self.savedSaturation),
            alpha: 1.0
        )
        self.savedColorView.backgroundColor = newColor
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.updateColor()
        self.updateSavedColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

