//
//  ResultViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer:Int = 0
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label1:UILabel!
    @IBOutlet weak var correct:UIImageView!
    override func viewDidLoad() {
    
        super.viewDidLoad()
        let pic1: UIImage! = UIImage(named: "God.png")
        let Pic2: UIImage! = UIImage(named: "ライザップ.jpg")
        let Pic3: UIImage! = UIImage(named: "images１.jpg")
        let Pic4: UIImage! = UIImage(named: "by-life-is-tech-43-638.jpg.png")
        let pic5: UIImage! = UIImage(named: "子猿.jpg")
        label2.text = String(format: "5問中%d問正解！",correctAnswer);
        
        
        if correctAnswer==1{
            label1.text = String("ライザップレベル")
            correct.image = Pic2
        }else if correctAnswer==2{
            label1.text = String("猿レベル")
            correct.image = pic5
        }
        else if  correctAnswer==3{
            label1.text = String("人間レベル")
            correct.image = Pic3
        } else if correctAnswer==4{
        label1.text  = String("Life is tech レベル")
            correct.image = Pic4
        }else if correctAnswer==5{
            label1.text = String("神レベル")
           correct.image = pic1
        }
    
        
        
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
