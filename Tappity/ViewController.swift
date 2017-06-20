//
//  ViewController.swift
//  Tappity
//
//  Created by Haichen Huang on 30/5/17.
//  Copyright © 2017 Haichen Huang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var counter = 10
    var score = 0
    var recordData:String!
    var timer = Timer()
    let array = [15, 33, 36, 723, 77, 4]

    var array2 = [(2, "is"), (0, "Hello"), (1, "this"), (3, "Ben")]
    
    @IBOutlet weak var buttons: UIButton!

    @IBOutlet weak var scoreNumber: UILabel!
    @IBOutlet weak var timeNumber: UILabel!
    
    
    let colourArray = [UIColor.green, UIColor.blue, UIColor.yellow, UIColor.gray, UIColor.black, UIColor.brown, UIColor.cyan, UIColor.orange, UIColor.white, UIColor.purple]
    
    @IBAction func button() {
        
        
        let i = arc4random_uniform(10)
        self.view.backgroundColor = colourArray[Int(i)]
        
        
        if score < 1 {
            
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
        }
        
        score += 1
        scoreNumber.text = "\(score)"
        
        // Find the button's width and height
        let buttonWidth = buttons.frame.width
        let buttonHeight = buttons.frame.height
        
        // Find the width and height of the enclosing view
        let viewWidth = buttons.superview!.bounds.width
        let viewHeight = buttons.superview!.bounds.height
        
        // Compute width and height of the area to contain the button's center
        let xwidth = viewWidth - buttonWidth
        let yheight = viewHeight - buttonHeight
        
        // Generate a random x and y offset
        let xoffset = CGFloat(arc4random_uniform(UInt32(xwidth)))
        let yoffset = CGFloat(arc4random_uniform(UInt32(yheight)))
        
        // Offset the button's center by the random offsets.
        buttons.center.x = xoffset + buttonWidth / 2
        buttons.center.y = yoffset + buttonHeight / 2
        
        
    }
    
    func updateCounter() {
        
        counter -= 1
        timeNumber.text = "\(counter)"
        
        if counter == 0 {
            
            
            timer.invalidate()
            
            if recordData == nil {
                
                let highscore = String(score)
                let userDefaults = Foundation.UserDefaults.standard
                userDefaults.set(highscore, forKey: "record1")
                
                let alert = UIAlertController(title: "Gameover", message: "Your Score is \(self.score)", preferredStyle: UIAlertControllerStyle.actionSheet)
                alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: {
                    (action: UIAlertAction!) in self.highscoreSet()
                }))
                self.present(alert, animated: true, completion: nil)
                
                self.score = 0

                
                
            } else {
                
                let score:Int? = Int(self.score)
                let record:Int? = Int(recordData)
                
                
                if score! > record! {
                    
                    let highscore = String(self.score)
                    let userDefaults = Foundation.UserDefaults.standard
                    userDefaults.set(highscore, forKey: "record1")
                    
                    let alert = UIAlertController(title: "New HighScore!", message: "New Record of \(self.score)", preferredStyle: UIAlertControllerStyle.actionSheet)
                    alert.addAction(UIAlertAction(title: "Set New Record", style: UIAlertActionStyle.default, handler: {
                        (action: UIAlertAction!) in self.highscoreSet()
                    }))
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    let defaults = UserDefaults.standard
                    defaults.set(array2, forKey: "ArrayTesting")
                    

                    
                    
                } else {
                    
                    let alert = UIAlertController(title: "Game Over", message: "Your Score is \(self.score)", preferredStyle: UIAlertControllerStyle.actionSheet)
                    alert.addAction(UIAlertAction(title: "Restart", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.score = 0

                    
                }
                
                
            }
            
          
            
            
            
            counter = 10
            
            self.view.backgroundColor = UIColor.white
            
            
            scoreNumber.text = "\(score)"
            timeNumber.text = "\(counter)"
            
            buttons.center.x = buttons.superview!.bounds.width / 2
            buttons.center.y = buttons.superview!.bounds.height / 2
            
        }
        
    }
    
   
    func highscoreSet() {
        
        score = 0
        scoreNumber.text = "\(score)"

    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let userDefaults = Foundation.UserDefaults.standard
        let value = userDefaults.string(forKey: "record1")
        recordData = value
        
        //let sortedArray = array2.sorted { $1.0 < $0.0 }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

