# GA MOB 4 - Lesson Plan 11 - App Workflow


## Lesson Objectives

* Plan an app from idea to user interface to coding strategy
* Build a custom UI interaction
* Build an object model
* Extend the app once the MVP is done

## Topics

* Converting Strings to Doubles.
* Designing an Object model
* UIPickerView, its protocols and delegates
* View tags

## Example – Build a unit-converter app

* Draw the user interface
    * Inspiration from other unit converter apps (eg Amount)
    * Numeric keys + clear + dot
    * Place input and output
* Outline the interaction
    * Picker for selecting the conversion
    * Type to add digits to the input
    * Clear button to remove the input and set it to zero
* Design the object model in a playground
    * Conversion class
    * Specific classes for converting various units
    * Convert methods
    * Description for display
    * Test it
* Build the user interface
    * Single view, no segues
    * Add a bunch of buttons for the input
    * Add a button for selecting the conversion
* Hook up and test the UI
