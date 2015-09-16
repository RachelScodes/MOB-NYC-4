# GA MOB 4 - Lesson Plan - 02 - Mobile Design and Storyboards


## Objectives

Students will be able to:

* Execute the homework submission workflow.
* Discuss tenets of mobile development and what makes it different from web and desktop.
* Create prototype-level apps powered with Navigation Controllers.
* Identify common Views that comprise iOS apps.

## Review of Mobile Design Patterns and Principles

### Mobile Design Review

* How is mobile different?
    * Less UI real estate
    * Wide range of devices
    * Touch gestures
    * Usage context
    * Network latency
* Gestural Interfaces
* Device-Specific Guidelines
* Mobile Design Patterns
    * Navigation
    * Screen-level actions
    * User onboarding
    * Lists, filtering, and empty sets
    * Dialog boxes

### More Mobile Patterns

* Left/right reveals
* Pull-down shelf
* Pull-up shelf
* Swipe-to-reveal

### Activity - App Screenshots

Screenshot some apps, identify one example each of:

* Navigation
* Screen-level actions
* User onboarding
* Lists, filtering, and empty sets
* Dialog boxes


## Review of Views

*We’ll review a few of the views we’ve used before, talk about their "attributes," and play around a bit more.*

*Now let’s talk about more common views that we’ll be using for the upcoming assignment.*


### Catalog of common views

* Image View
* Label
* Buttons
* Table View
* Table View Cell
* Navigation Bar
* Navigation Bar Item
* Text Field
* Text View

#### For each view

* What it looks like in a storyboard
* Example from an app
* How to use it
* Important parameters and what they do
* iOS view references for various views

### Activity - Table Views

Build a Dog Catalog App with a UITableView.


## Introduction to Storyboards

* What are storyboards? Why are they useful?
* View Controllers + Scenes
* Navigation Controllers
* Segues

### A warning about Interface Builder and Storyboards


*There’s a lot of flexibility in Storyboards. Unfortunately, there aren’t many "guardrails" to keep you from doing stuff that simply doesn’t work. In addition, the critical-path features that we need are often obscure and hidden away.*


### What are Storyboards?


Storyboards are a mechanism that enables you to compose multiple Scenes, the transitions between them, and their respective Views in a single place.


#### Website Sitemaps

* Sitemaps that web designers draw show the structure of the site and describe the "flow" from one page to another.
* Storyboards are like this. It shows various screens of the app (called "Scenes"), and how one flows to into the next.
* Each line of flow (transition) from one Scene to the another is called a "Segue."

### View Controllers + Scenes


View Controllers manage Views and generally represent one "Scene" of an app. We can attach a bunch of code to a View Controller. That’s where the "logic" for an app generally lives.


### Navigation Controllers


Navigation Controllers manage View Controllers. A Navigation Controller decides which View Controller to display at any given moment, and it also keeps track of the ones that it has displayed and in which order. Think about how a web browser keeps track of history.

* Initial View Controller - The first View Controller an app will display.
* Root View Controller - The first View Controller that a Navigation Controller will show.

### Segues

* Segues are formal transitions between one View Controller and another.
* There are several types that determine how a View Controller is "presented" to the user.
* Source and Destination View Controllers.

### App User Flow


Take a simple note app. It can be structured a few different ways:

* List → Single (Notes app)
* Single → Modal List (iA Writer)
* Single → Reveal (Hackulator)

## Assessment - Prototyping Apps with Storyboards

Build a "Vanity" App.
