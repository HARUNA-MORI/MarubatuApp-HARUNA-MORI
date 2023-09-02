//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 春菜森 on 2023/09/02.
//

import UIKit

class ViewController: UIViewController {
    
    //◾️変数格納場所_（レシピの材料表示のようなもの）_________________________________________________________________
    //一番上のラベル
    @IBOutlet weak var questionLabel: UILabel!
    // 表示中の問題番号を格納
    var currentQuestionNum: Int = 0
    
    // 問題
    let questions: [[String: Any]] = [
        [
            "question": "iPhoneアプリを開発する統合環境はZcodeである",
            "answer": false
        ],
        [
            "question": "Xcode画面の右側にはユーティリティーズがある",
            "answer": true
        ],
        [
            "question": "UILabelは文字列を表示する際に利用する",
            "answer": true
        ]
    ]
    
    //◾️◾️区切り目_______________________________________________________________________
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ここで実行するぞ
        showQuestion()
    }
    
    //問題を表示する関数
    func showQuestion(){
        let question = questions[currentQuestionNum]
        if let que = question["question"] as? String{
            questionLabel.text = que
        }
    }
    //解答チェックの関数、正解なら次の問題を表示
    func checAnswer(yourAnswer: Bool){
        let question = questions[currentQuestionNum]
        
        if let ans = question["answer"] as? Bool {
            if yourAnswer == ans {
                //正解の時の処理
                //currentQuestionNumに＋１して次の問題に進む指示
                currentQuestionNum += 1
                showAlert(message: "やる子だな✨")
            } else {
                //不正解の時の処理
                showAlert(message: "お前なめとるな💢")
            }
            
        } else {
            print("答えが入ってませんが！あっ？")//答えがない時の解答
            return
        }
        
        //currentQuestionNumの値が問題数以上なら最初の問題へ
        if currentQuestionNum >= questions.count {
            currentQuestionNum = 0
        }
        showQuestion()//正解 → 次の問題表示、不正解 → 同じ問題表示
    }

    func showAlert(message: String) {
        let alert = UIAlertController(
            title: nil,
            message: message,
            preferredStyle:  .alert)
        
      let close = UIAlertAction(
            title: "閉じる",
            style: .cancel)
        alert.addAction(close)
        present(alert, animated: true)
                                  
    }
    
    
    
    //◾️◾️◾️変数格納場所_（レシピの調理方法の表示のようなもの）__________________________________________________________
    //❌ボタン
    @IBAction func tappedNoButton(_ sender: Any) {
        checAnswer(yourAnswer: false)
        
    }
    
    //⭕️ボタン
    @IBAction func tappedYesButton(_ sender: Any) {
        checAnswer(yourAnswer: true)
    }
    
    
    
}

