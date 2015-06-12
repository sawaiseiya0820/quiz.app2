//
//  QuizViewController.swift
//  Quiz
//
//  Created by ohtatomotaka on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //出題数
    var questionNumber:Int = 5
    
    //現在の問題数
    var sum:Int = 0
    
    //正解数
    var correctAnswer:Int = 0
    
    //乱数
    var random:Int = 0
    
    //クイズを格納する配列
    var quizArray = [NSMutableArray]()
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons: Array<UIButton>!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        class ViewController: UIViewController, UISearchBarDelegate {
            
            private var mySearchBar: UISearchBar!
            private var myLabel : UILabel!
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
                // 背景を白に設定する.
                self.view.backgroundColor = UIColor.whiteColor()
                
                // 検索バーを作成する.
                mySearchBar = UISearchBar()
                mySearchBar.delegate = self
                mySearchBar.frame = CGRectMake(0, 0, 300, 80)
                mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100)
                
                // 影をつける.
                mySearchBar.layer.shadowColor = UIColor.blackColor().CGColor
                mySearchBar.layer.shadowOpacity = 0.5
                mySearchBar.layer.masksToBounds = false
                
                // キャンセルボタンを有効にする.
                mySearchBar.showsCancelButton = true
                
                // ブックマークボタンを無効にする.
                mySearchBar.showsBookmarkButton = false
                
                // バースタイルをDefaultに設定する.
                mySearchBar.searchBarStyle = UISearchBarStyle.Default
                
                // タイトルを設定する.
                mySearchBar.prompt = "タイトル"
                
                // 説明文を設定する.
                mySearchBar.placeholder = "ここに入力してください"
                
                // カーソル、キャンセルボタンの色を設定する.
                mySearchBar.tintColor = UIColor.redColor()
                
                // 検索結果表示ボタンは非表示にする.
                mySearchBar.showsSearchResultsButton = false
                
                // 検索バーをViewに追加する.
                self.view.addSubview(mySearchBar)
                
                // UITextFieldを作成する.
                myLabel = UILabel(frame: CGRectMake(0,0,200,30))
                myLabel.center = CGPoint(x: self.view.frame.width/2, y: self.view.frame.height/2)
                myLabel.text = ""
                myLabel.layer.borderWidth = 1.0
                myLabel.layer.borderColor = UIColor.grayColor().CGColor
                myLabel.layer.cornerRadius = 10.0
                
                // Viewに追加する.
                self.view.addSubview(myLabel)
            }
            
            /*
            テキストが変更される毎に呼ばれる
            */
            func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
                myLabel.text = searchText
            }
            
            /*
            Cancelボタンが押された時に呼ばれる
            */
            func searchBarCancelButtonClicked(searchBar: UISearchBar) {
                myLabel.text = ""
                mySearchBar.text = ""
            }
            
            /*
            Searchボタンが押された時に呼ばれる
            */
            func searchBarSearchButtonClicked(searchBar: UISearchBar) {
                myLabel.text = "Searching"
                mySearchBar.text = ""
                self.view.endEditing(true)
            }
        }
        
        
        class QuizViewController: UIViewController {
            
            //時間計測用の変数.
            var cnt : Float = 0
            
            //時間表示用のラベル.
            var myLabel: UILabel!
            
            override func viewDidLoad() {
                
                //ラベルを作る.
                myLabel = UILabel(frame: CGRectMake(0,0,200,50))
                myLabel.backgroundColor = UIColor.orangeColor()
                myLabel.layer.masksToBounds = true
                myLabel.layer.cornerRadius = 20.0
                myLabel.text = "Time:\(cnt)"
                myLabel.textColor = UIColor.whiteColor()
                myLabel.shadowColor = UIColor.grayColor()
                myLabel.textAlignment = NSTextAlignment.Center
                myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
                self.view.backgroundColor = UIColor.cyanColor()
                self.view.addSubview(myLabel)
                
                //タイマーを作る.
                NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            }
            
            //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
            func onUpdate(timer : NSTimer){
                
                cnt += 0.1
                
                //桁数を指定して文字列を作る.
                let str = "Time:".stringByAppendingFormat("%.1f",cnt)
                
                myLabel.text = str
                
            }
            
        }
        
        
        
        
        //------------------------ここから下にクイズを書く------------------------//
       
        quizArray.append(["切ると涙が止まらない（玉ねぎ）ですがその原因となる物質は？","硫化アリル","硫酸","塩化水素",1])
        quizArray.append(["野菜の代表キュウリの原産地は？","アメリカ","インド","日本",2])
        quizArray.append(["原材料にトウモロコシを使っているお酒は？","バーボン","ブランデー","ウイスキー",1])
        quizArray.append(["レタスは何科の植物でしょう？","ヒルガオ科","キク科","イヌ科",2])
        quizArray.append(["江戸時代ぶしが食べなかった野菜は？","キュウリ","ナス","にんにく",1])
        quizArray.append(["日本のみが食用栽培している野菜は？","ごぼう","かぶ","アスパラガス",1])
        
        //------------------------ここから下にクイズを書く------------------------//
        choiceQuiz()
    }
    
    func choiceQuiz() {
        println(quizArray.count)
        //クイズの問題文をシャッフルしてTextViewにセット
        random = Int(arc4random_uniform(UInt32(quizArray.count)))
        quizTextView.text = quizArray[random][0] as! NSString   as String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        for var i = 0; i < choiceButtons.count; i++ {
            choiceButtons[i].setTitle((quizArray[random][i+1] as! NSString)     as NSString as String,     forState: .Normal)
            
            //どのボタンが押されたか判別するためのtagをセット
            choiceButtons[i].tag = i + 1;
        }
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        sum++
        println("random \(random)")
        if quizArray[random][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer++
        }
        
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if sum == questionNumber {
            performSegueToResult()
        }
        quizArray.removeAtIndex(random)
        choiceQuiz()
    }
    
    func performSegueToResult() {
        performSegueWithIdentifier("toResultView", sender: nil)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "toResultView") {
            
            var ResultView : ResultViewController = segue.destinationViewController as! ResultViewController

            ResultView.correctAnswer = self.correctAnswer
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


