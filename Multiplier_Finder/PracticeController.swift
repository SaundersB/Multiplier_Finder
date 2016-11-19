//
//  PracticeController.swift
//  Multiplier_Finder
//
//  Created by Brandon_Saunders on 10/29/16.
//  Copyright © 2016 Brandon_Saunders. All rights reserved.
//

import Foundation
import UIKit

class PracticeController: UIViewController {
    var cardView: UIView!
    var back: UIImageView!
    var front: UIImageView!
    var showingBack: Bool = false
    var textView: UILabel!
    var current_factor: Int!
    var next_factor: Int!
    var starting_factor: Int!
    var down_arrow_view: UIImageView!
    var right_arrow_view: UIImageView!
    var left_arrow_view: UIImageView!
    var main_view: UIView!
    var arrow_height = CGFloat(114)
    var arrow_width = CGFloat(150)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showingBack = false
        
        setupView()
        
        setupBackground()
        
        setupPracticeHeaderLabel()

        setupFlashCard()

        setupGestureRecognition()

        setupFlashCardText()
        
        setupDownArrow()
        
        setupDownArrowHeader()
        
        
        setupSideArrows()
        
        setupSideArrowHeaders()
    }
    
    func setupView() {
        main_view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - (view.frame.height * 0.98)))
        main_view.backgroundColor = .white
        view.addSubview(main_view)
    }
    
    func setupBackground() {
        let background_image = UIImage(named: "blackboard.jpg")
        let uicolor = UIColor(patternImage: background_image!)
        view.backgroundColor = uicolor
    }
    
    
    func setupPracticeHeaderLabel() {
        let label_rectangle = CGRect(x: 0, y: self.view.frame.height * 0.05, width: view.frame.width, height: 60)
        let practice_label = UILabel(frame: label_rectangle)
        practice_label.font = UIFont(name: "American Typewriter", size: 60)
        practice_label.text = "MULTIPLICATION PRACTICE"
        practice_label.textColor = .white
        practice_label.layer.borderWidth = 3
        practice_label.layer.cornerRadius = 10.0
        practice_label.layer.masksToBounds = true
        practice_label.layer.borderColor = UIColor.white.cgColor
        practice_label.adjustsFontSizeToFitWidth = true
        practice_label.minimumScaleFactor = 0.2
        practice_label.numberOfLines = 1
        practice_label.textAlignment = .center
        view.addSubview(practice_label)
    }
    

    
    func setupFlashCard() {
        // The initialized value from the selection menu.
        print("Value: "  + String(self.starting_factor))
        
        current_factor = self.starting_factor
        next_factor = 1
        
        // Create the UI flash card.
        front = UIImageView(image: UIImage(named: "flash_card.png"))
        back = UIImageView(image: UIImage(named: "flash_card.png"))
        
        front.layer.cornerRadius = 10.0
        back.layer.cornerRadius = 10.0

    }
    
    func setupGestureRecognition() {
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(PracticeController.tapped))
        singleTap.numberOfTapsRequired = 1
        let rect = CGRect(x: front.frame.size.width/2, y: front.frame.size.height/2, width: (front.image?.size.width)!, height: (front.image?.size.height)!)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(PracticeController.respondToSwipeGesture))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(PracticeController.respondToSwipeGesture))
        swipeDown.direction = UISwipeGestureRecognizerDirection.down
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(PracticeController.respondToSwipeGesture))
        swipeUp.direction = UISwipeGestureRecognizerDirection.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(PracticeController.respondToSwipeGesture))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        cardView = UIView(frame: rect)
        cardView.center = view.center
        cardView.isUserInteractionEnabled = true
        cardView.addGestureRecognizer(singleTap)
        cardView.addSubview(front)
    }
    
    func setupFlashCardText() {
        let message = String(current_factor) + " X " + String(next_factor)
        superimposeText(card_information: String(message))
        
        view.addSubview(cardView)
    }
    
    func setupDownArrow() {
        down_arrow_view = UIImageView(frame: CGRect(x: self.view.bounds.width * 0.45, y: self.view.bounds.height - 100, width: 50, height: 100))
        let down_arrow = UIImage(named: "arrow_down")
        down_arrow_view.image = down_arrow
        view.addSubview(down_arrow_view)
    }
    
    func setupDownArrowHeader() {
        let label_size = CGFloat(25)
        let label_rectangle = CGRect(x: 0, y: self.view.frame.height - (down_arrow_view.frame.height + 30), width: view.frame.size.width, height: label_size)
        let arrow_label = UILabel(frame: label_rectangle)
        arrow_label.font = UIFont(name: "American Typewriter", size: 25)
        arrow_label.text = "SWIPE DOWN TO SELECT ANOTHER SET"
        arrow_label.textColor = .white
        arrow_label.layer.borderWidth = 3
        arrow_label.layer.cornerRadius = 10.0
        arrow_label.layer.masksToBounds = true
        arrow_label.layer.borderColor = UIColor.white.cgColor
        arrow_label.adjustsFontSizeToFitWidth = true
        arrow_label.minimumScaleFactor = 0.2
        arrow_label.numberOfLines = 1
        arrow_label.textAlignment = .center
        view.addSubview(arrow_label)
    }
    
    func setupSideArrows(){
        right_arrow_view = UIImageView(frame: CGRect(x: self.view.bounds.width - arrow_width, y: self.view.bounds.height/2 - arrow_height, width: arrow_width, height: arrow_height))
        let right_arrow = UIImage(named: "arrow_right")
        right_arrow_view.image = right_arrow
        view.addSubview(right_arrow_view)
        
        left_arrow_view = UIImageView(frame: CGRect(x: 0, y: self.view.bounds.height/2 - arrow_height, width: arrow_width, height: arrow_height))
        let left_arrow = UIImage(named: "arrow_left")
        left_arrow_view.image = left_arrow
        view.addSubview(left_arrow_view)
    }
    
    func setupSideArrowHeaders() {
        
    }
    
    
    func respondToSwipeGesture(gesture: UISwipeGestureRecognizer) {
        print("RespondetoSwipeGesture")
        print(gesture.direction)
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.right:
                print("Swiped right")
                flip_card_to_the_right()
            case UISwipeGestureRecognizerDirection.down:
                print("Swiped down")
                dismiss(animated: true, completion: nil)
            case UISwipeGestureRecognizerDirection.left:
                print("Swiped left")
                flip_card_to_the_left()
            case UISwipeGestureRecognizerDirection.up:
                print("Swiped up")
            default:
                break
            }
        }
        
    }
    
    func returnToSelector(_ sender: UIButton) {
        print("Button pressed")
        let secondViewController:Selector = Selector()
        self.dismiss(animated: true, completion: {})
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func flip_card_to_the_right() {
        if (self.showingBack) {
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            displayQuestion()
            self.showingBack = false
        }
        increment_factor()
    }
    
    func flip_card_to_the_left() {
        if (!self.showingBack) {
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            displayAnswer()
            next_factor! += 1
            self.showingBack = true
        }
        increment_factor()
    }
    
    func increment_factor() {
        if(next_factor! >= 13){
            next_factor! = 1
            current_factor! += 1
        }
    }
    
    func is_showing_back_card() -> Bool{
        if (self.showingBack) { return true }
        else { return false }
    }
    
    
    func tapped() {
        print("tapped")
        
        if (self.showingBack) {
            print("Transitioning from back to front")
            UIView.transition(from: back, to: front, duration: 1, options: UIViewAnimationOptions.transitionFlipFromRight, completion: nil)
            displayQuestion()
            
            self.showingBack = false
        } else {
            print("Transitioning from front to back")
            UIView.transition(from: front, to: back, duration: 1, options: UIViewAnimationOptions.transitionFlipFromLeft, completion: nil)
            displayAnswer()
            
            next_factor! += 1

            self.showingBack = true
        }
        
        increment_factor()
    }
    
    func swipedUp() {
        // Waiting for a later implementation.
    }
    
    
    func displayQuestion() {
        let message = String(current_factor) + " X " + String(next_factor)
        superimposeText(card_information: String(message))
    }
    
    func displayAnswer() {
        let product = current_factor * next_factor
        superimposeText(card_information: String(product))
    }
    
    func superimposeText(card_information: String) {
        print("Superimposing Text onto UIView in Practice Controller")
        // Initialize the rectangle that the text view will be placed in.
        self.textView = UILabel(frame: CGRect(x: back.frame.width/2, y: back.frame.height/2, width: back.frame.width, height: back.frame.height))
        self.textView.text = card_information
        self.textView.numberOfLines = 1
        self.textView.textAlignment = .center
        
        self.textView.font = UIFont.systemFont(ofSize: 50)
        self.textView.adjustsFontSizeToFitWidth = true
        
        if(showingBack){
            self.textView.center = self.back.center
        } else {
            self.textView.center = self.back.center
        }
        cardView.addSubview(self.textView)
    }
    
    
    func buttonClicked() {
        print("Button clicked")
    }
    
    
}

