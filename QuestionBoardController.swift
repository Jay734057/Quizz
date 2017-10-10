//
//  ViewController.swift
//  Quizz
//
//  Created by Jianyu ZHU on 10/10/17.
//  Copyright © 2017 Unimelb. All rights reserved.
//

import UIKit

class QuestionBoardController: UIViewController {
    
    let questionView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 42, green: 132, blue: 210)
        return view
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont(name: "HelveticaNeue-Thin", size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let progressView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 42, green: 132, blue: 210)
        return view
    }()
    
    let progressBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 236, green: 186, blue: 16)
        return view
    }()
    
    let progressLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = " 1/x"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = UIColor.white
        label.font = UIFont.systemFont(ofSize: 17)
        label.text = "Score: 9999 "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let buttonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 42, green: 132, blue: 210)
        return view
    }()
    
    let trueButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 0
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleShadowColor(UIColor.rgb(red: 128, green: 128, blue: 128), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(red: 49, green: 163, blue: 67)
        button.setTitle("True", for: .normal)
        button.addTarget(self, action: #selector(handleButtonPress), for: .touchUpInside)
        return button
    }()
    
    let falseButton: UIButton = {
        let button = UIButton(type: .system)
        button.tag = 1
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitleShadowColor(UIColor.rgb(red: 128, green: 128, blue: 128), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.rgb(red: 201, green: 63, blue: 69)
        button.setTitle("False", for: .normal)
        button.addTarget(self, action: #selector(handleButtonPress), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        progressBar.widthAnchor.constraint(equalToConstant: progressView.frame.size.width / CGFloat(questionBank.questionList.count)).isActive = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func setupView() {
        view.addSubview(questionView)
        view.addSubview(progressView)
        view.addSubview(buttonView)
        
        setupQuestionView()
        setupProgressBar()
        setupButtonView()
        
        nextQuestion()
    }
    
    func setupQuestionView() {
        questionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        questionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        questionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        questionView.heightAnchor.constraint(equalToConstant: 345).isActive = true
        
        questionView.addSubview(questionLabel)
        questionLabel.leftAnchor.constraint(equalTo: questionView.leftAnchor, constant: 16).isActive = true
        questionLabel.rightAnchor.constraint(equalTo: questionView.rightAnchor, constant: -16).isActive = true
        questionLabel.topAnchor.constraint(equalTo: questionView.topAnchor, constant: 28).isActive = true
        questionLabel.bottomAnchor.constraint(equalTo: questionView.bottomAnchor, constant: -27).isActive = true
        
    }
    
    func setupProgressBar() {
        progressView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        progressView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        progressView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        progressView.heightAnchor.constraint(equalToConstant: 47).isActive = true
        
        progressView.addSubview(progressBar)
        progressBar.leftAnchor.constraint(equalTo: progressView.leftAnchor).isActive = true
        
        progressBar.bottomAnchor.constraint(equalTo: progressView.bottomAnchor).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 14).isActive = true
        
        progressView.addSubview(progressLabel)
        progressLabel.leftAnchor.constraint(equalTo: progressView.leftAnchor, constant: 8).isActive = true
        progressLabel.widthAnchor.constraint(equalToConstant: 52).isActive = true
        progressLabel.topAnchor.constraint(equalTo: progressView.topAnchor).isActive = true
        progressLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        progressView.addSubview(scoreLabel)
        scoreLabel.rightAnchor.constraint(equalTo: progressView.rightAnchor, constant: -8).isActive = true
        scoreLabel.widthAnchor.constraint(equalToConstant: 116).isActive = true
        scoreLabel.topAnchor.constraint(equalTo: progressView.topAnchor).isActive = true
        scoreLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
    }
    
    func setupButtonView() {
        buttonView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        buttonView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        buttonView.bottomAnchor.constraint(equalTo: progressView.topAnchor).isActive = true
        buttonView.topAnchor.constraint(equalTo: questionView.bottomAnchor).isActive = true
        
        buttonView.addSubview(trueButton)
        trueButton.leftAnchor.constraint(equalTo: buttonView.leftAnchor, constant: 25).isActive = true
        trueButton.widthAnchor.constraint(equalToConstant: 128).isActive = true
        trueButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 60).isActive = true
        trueButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        buttonView.addSubview(falseButton)
        falseButton.rightAnchor.constraint(equalTo: buttonView.rightAnchor, constant: -25).isActive = true
        falseButton.widthAnchor.constraint(equalToConstant: 128).isActive = true
        falseButton.topAnchor.constraint(equalTo: buttonView.topAnchor, constant: 60).isActive = true
        falseButton.heightAnchor.constraint(equalToConstant: 56).isActive = true
    }
    
    let questionBank = QuestionBank()
    var questionIndex = 0
    
    func nextQuestion() {
        questionLabel.text = questionBank.questionList[questionIndex].questionText
    }
    
    func handleButtonPress(sender: UIButton) {
        questionIndex += 1
        if questionIndex < questionBank.questionList.count {
            nextQuestion()
        }
    }
}

