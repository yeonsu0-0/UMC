//
//  ViewController.swift
//  Week5
//
//  Created by yeonsu on 2022/10/31.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    var colorList: [UIColor] = [
        .blue,
        .brown,
        .clear,
        .cyan,
        .darkText,
        .gray,
        .lightText,
        .red,
        .yellow,
        .green
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        threadTest()
    }
    
    func threadTest() {
        // DispatchQueue.main      // Ui 작업 관련
        
        // 단일 Thread. 1-10까지 출력
        // 일을 여러 개의 스레드로 나누어서 처리
        // 동기 방식(sync): Ui 외 모든 작업 관련, 차례대로 수행
        
        // 비동기 (async): 다른 작업의 스레드가 끝나는 걸 기다리지 않고 같이 수행, 실행할 때마다 처리 순서가 달라짐
        /*
        DispatchQueue.global().async {
            for i in 1...10 {
                print(i)
                sleep(1)
                
            }
        }
        
        DispatchQueue.global().async {
            for i in 11...10 {
                print(i)
                sleep(1)
            }
         */
        
        DispatchQueue.global().async {
            for color in self.colorList {
                DispatchQueue.main.sync {
                    self.firstView.backgroundColor = color
                }
                sleep(1)
            }
        }
        
        DispatchQueue.global().async {
            for color in self.colorList.reversed() {
                DispatchQueue.main.sync {
                    self.secondView.backgroundColor = color
                }
                sleep(1)
            }
        }
    }
}
