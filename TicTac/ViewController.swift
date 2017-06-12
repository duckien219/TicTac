//
//  ViewController.swift
//  TicTac
//
//  Created by Kien Nguyen Duc on 6/9/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winningCombination = [[0, 1, 2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
    var gameIsActive = true
    var count = 0;

    @IBAction func action(_ sender: UIButton) {
        if  (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            if (activePlayer == 1) {
                sender.setImage(UIImage(named: "cross"), for: .normal)
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "nought"), for: .normal)
                activePlayer = 1
            }
            
        }
        count = count + 1
        for combination in winningCombination {
            
            if (gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]])
            {
                gameIsActive = false
                if gameState[combination[0]] == 1 {
                    // Cross has won
                        let alertController = UIAlertController(title: "", message: "Cross has won!", preferredStyle: UIAlertControllerStyle.alert)
                            let ok = UIAlertAction(title: "Play again", style: .default, handler: {(action) -> Void in
                                self.count = 0

                                self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                                self.gameIsActive = true
                                self.activePlayer = 1
                                for i in 1...9 {
                                    let button = self.view.viewWithTag(i) as! UIButton
                                    button.setImage(nil, for: .normal)
                                }
                                
                                })
                            let cancel = UIAlertAction(title: "CANCEL", style: .destructive, handler: {(action) -> Void in
                                exit(1)
                            })
                            alertController.addAction(ok)
                            alertController.addAction(cancel)
                            self.present(alertController,animated: true, completion: nil)

                    
                    
                } else{
                    //nought has won
                    let alertController = UIAlertController(title: "", message: "Nought has won!", preferredStyle: UIAlertControllerStyle.alert)
                    let ok = UIAlertAction(title: "Play again", style: .default, handler: {(action) -> Void in
                       self.count = 0
                        self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                        self.gameIsActive = true
                        self.activePlayer = 1
                        for i in 1...9 {
                            let button = self.view.viewWithTag(i) as! UIButton
                            button.setImage(nil, for: .normal)
                        }
                    })
                    let cancel = UIAlertAction(title: "CANCEL", style: .destructive, handler: {(action) -> Void in
                        exit(1)
                    })
                    alertController.addAction(ok)
                    alertController.addAction(cancel)
                    self.present(alertController,animated: true, completion: nil)
                }
                
                
                
            }
            
        }
        if (count == 9){
            let alertController = UIAlertController(title: "", message: "Game Draw!", preferredStyle: UIAlertControllerStyle.alert)
            let ok = UIAlertAction(title: "Play again", style: .default, handler: {(action) -> Void in
                self.count = 0

                self.gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
                self.gameIsActive = true
                self.activePlayer = 1
                for i in 1...9 {
                    let button = self.view.viewWithTag(i) as! UIButton
                    button.setImage(nil, for: .normal)
                }
            })
            let cancel = UIAlertAction(title: "CANCEL", style: .destructive, handler: {(action) -> Void in
                exit(1)
            })
            alertController.addAction(ok)
            alertController.addAction(cancel)
            self.present(alertController,animated: true, completion: nil)
        }
    }
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    


    
}

