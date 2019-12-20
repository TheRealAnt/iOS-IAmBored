//
//  IAmBoredView.swift
//  IAmBored
//
//  Created by Antonie on 2019/12/20.
//  Copyright © 2019 antonie. All rights reserved.
//

import UIKit

class IAmBoredView: UIViewController {
    
    // MARK: - Properties
    var activityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 23.0)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var IAmStillBoredButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        button.backgroundColor = UIColor.init(red: 46/255, green: 204/255, blue: 113/255, alpha: 0.8)
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle("Gimmie another, I'm still bored", for: UIControl.State.normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.sizeToFit()
        
        return button
    }()
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchBoredActivity()
        setupViewComponents()
        setupIAmStillBoredButton()
    }
    
    // MARK: - Helper Functions
    
    @objc func buttonAction(sender:UIButton!)
    {
        fetchBoredActivity()
    }
    
    func setupViewComponents() {
        title = Bundle.main.displayName
        view.backgroundColor = UIColor.init(red: 26/255, green: 188/255, blue: 156/255, alpha: 1.0)
        setupActivityLabel()
    }
    
    func setupActivityLabel() {
        view.addSubview(activityLabel)
        activityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        activityLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                      = true
        activityLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive    = true
        activityLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
    }
    
    func setupIAmStillBoredButton(){
        view.addSubview(IAmStillBoredButton)
        IAmStillBoredButton.translatesAutoresizingMaskIntoConstraints = false
        
        IAmStillBoredButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                       = true
        IAmStillBoredButton.heightAnchor.constraint(equalToConstant: 60).isActive                                                = true
        IAmStillBoredButton.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func fetchBoredActivity(){
        
        let jsonUrlString = "https://www.boredapi.com/api/activity"
        
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, reponse, err) in
            guard let data = data  else { return }
            #if DEBUG
            print(data)
            #endif
            
            do {
                let jsonData = try JSONDecoder().decode(Bored.BoredAPI.self, from: data)
                
                #if DEBUG
                print(jsonData)
                #endif
                
                DispatchQueue.main.async {
                    self.activityLabel.text = jsonData.activity!
                }
            }
            catch let jsonerr {
                print("error serrializing error",jsonerr)
            }
            }.resume()
    }
}
