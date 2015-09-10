//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Divine Davis on 9/6/15.
//  Copyright (c) 2015 Juniper Street. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //All the odd numbers will be noughts & even will be crosses
    var goNumber = 1
    var winner = 0
    
    //0 = empty, 1 = nought, 2 = cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var playAgain: UIButton!
    
    @IBAction func playAgainButton(sender: AnyObject) {
        
        goNumber = 1
        winner = 0
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        playAgain.alpha = 0
        
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        
        var button : UIButton = view.viewWithTag(1) as! UIButton
        
        button.setImage(nil, forState: .Normal)
        
    }
    @IBAction func buttonPressed(sender: AnyObject) {

        var image = UIImage()
        
        if (gameState[sender.tag] == 0) && winner == 0 {
        
        println(sender.tag)
        
        if (goNumber % 2 == 0 ) {
            
        image = UIImage(named: "cross.png")!
            gameState[sender.tag] = 2
        } else {
            
        image = UIImage(named: "nought.png")!
            gameState[sender.tag] = 1
        }
            
            for combination in winningCombinations {
                
                if (gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]) && gameState[combination[0]] != 0{
                    
                    winner = gameState[combination[0]]
                }
                
            }
            
            if (winner != 0) {
                
                println("We have a winner")
                
                if (winner == 1) {
                    
                    label.text = "Noughts has won"
                    label.backgroundColor = UIColor .blueColor()
                } else {
                    label.text = "Crosses has won"
                    label.backgroundColor = UIColor .blueColor()
                }
                
                UIView.animateWithDuration(1, animations: {
                    self.label.center = CGPointMake(self.label.center.x + 400, self.label.center.y)
                    
                    self.playAgain.alpha = 1
                })
            }
        
        goNumber++
        sender.setImage(image, forState: .Normal)

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        label.center = CGPointMake(label.center.x - 400, label.center.y)
        playAgain.alpha = 0
    }
    
    


}

