//
//  ViewController.swift
//  RPSGame
//
//  Created by 김현석 on 2022/07/27.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    // 처음엔 묵으로 저장.
    var myChoice: Rps = Rps.rock
    var comChoice: Rps = Rps(rawValue: Int.random(in: 0...2))!
    
    // 함수 / 메서드
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready.png")
        
        // 2) 첫번째/두번째 레이블에 "준비"라고 문자열을 띄워야함.
        comChoiceLabel.text = "준비"
        myChoiceLabel.text = "준비"
    }
    
    
    @IBAction func rpsButtonTapped(_ sender: UIButton) {
        // 가위/바위/보(enum)를 선택해서 그 정보를 저장해야됨.
        
        // 버튼의 문자를 가져옴
        // 가위 / 바위/ 보를 나타냄 currentTitle은 옵셔널이라 바인딩해줘야함.
        guard let title = sender.currentTitle else { return }
        print(title)
        
//        let title = sender.currentTitle!
        
        switch title {
        case "가위":
            // 가위 열거형을 만들어서 저장.
            myChoice = Rps.scissors
            print("myChoice : \(myChoice)")
        case "바위":
            // 바위 열거형을 만들어서 저장.
            myChoice = Rps.rock
            print("myChoice : \(myChoice)")
        case "보":
            // 보 열거형을 만들어서 저장.
            myChoice = Rps.paper
            print("myChoice : \(myChoice)")
        default:
            break
        }
        
        
    }
    
    
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 1) 컴퓨터가 랜덤 선택한 것을 이미지 뷰에 표시
        // 2) 컴퓨터가 랜덤 선택한 것을 레이블에 표시
        switch comChoice {
        case Rps.rock:
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case Rps.paper:
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        case Rps.scissors:
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        default:
            break
        }
        
        // 3) 내가 선택한 것을 이미지 뷰에 표시
        // 4) 내가 선택한 것을 레이블에 표시
        switch myChoice {
        case Rps.rock:
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case Rps.paper:
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        case Rps.scissors:
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        default:
            break
        }
        
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 이겼는지/졌는지 판단 후 표시
        if comChoice == myChoice {
            mainLabel.text = "비겼다"
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼다"
        } else if comChoice == .paper && myChoice == .scissors {
            mainLabel.text = "이겼다"
        } else if comChoice == .scissors && myChoice == .rock {
            mainLabel.text = "이겼다"
        } else {
            mainLabel.text = "졌다"
        }
        
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 다시 처음 준비 이미지뷰에 표시
        // 2) 컴퓨터가 다시 처음 준비 문자열 표시
        comImageView.image = UIImage(named: "ready.png")
        comChoiceLabel.text = "준비"
        
        
        // 3) 내 선택 이미지뷰에도 준비 이미지뷰에 표시
        // 4) 내 선택 레이블에도 준비 문자열을 표시
        myChoice = Rps(rawValue: Int.random(in: 0...2))!
        myChoiceLabel.text = "준비"
        
        
        // 5) 메인 레이블에도 "선택하세요"라고 표시
        mainLabel.text = "선택하세요"
        
        
        // 6) 컴퓨터가 다시 랜덤 가위/바위/보를 선택하고 저장
        comChoice = Rps(rawValue: Int.random(in: 0...2))!
        
        
    }
    
    
}
