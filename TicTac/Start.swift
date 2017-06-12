//
//  Start.swift
//  TicTac
//
//  Created by Kien Nguyen Duc on 6/9/17.
//  Copyright © 2017 Kien Nguyen. All rights reserved.
//

import UIKit
class Start: UIViewController {

    @IBOutlet weak var lbl_tictac: UILabel!
    @IBOutlet weak var lbl_owner: UILabel!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        lbl_tictac!.alpha = 0
        lbl_owner.alpha = 0
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 3, animations: {
            self.lbl_tictac!.alpha = 1
            
        }){_ in
            UIView.animate(withDuration: 3, animations: {
                self.lbl_owner!.center = CGPoint(x: self.lbl_owner!.center.x, y: 350)
                self.lbl_owner!.alpha = 1
            }){_ in // chuyển sang màn hình chính
                UIView.animate(withDuration: 2, animations: {

                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                self.present(vc, animated: true, completion: nil)
                })
            }
        }
    }

  

}
