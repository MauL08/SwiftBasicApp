//
//  ViewController.swift
//  RandomPhotos
//
//  Created by Akbar Maulana on 27/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .white
        return imageView
    }()
    
    private let button: UIButton = {
       let button = UIButton()
        button.backgroundColor = .red
        button.setTitle("Tap to change image", for: .normal)
        return button
    }()
    
    @objc func onTapButton() {
        getRandomImage(from: "https://source.unsplash.com/random/800x800")
    }
    
    func getRandomImage(from url: String) {
        // activityIndicator!.startAnimating()
//        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//            guard let data = data, error == nil else {
//                print("something wrong on data")
//                return
//            }
//            self.imageView.image = UIImage(data: data)
//            // self.activityIndicator?.stopAnimating()
//        })
//        task.resume()
        
        guard let data = try? Data(contentsOf: URL(string: url)!) else {
            return
        }
        
        imageView.image = UIImage(data: data)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        button.frame = CGRect(x: 30, y: view.frame.size.height-80-view.safeAreaInsets.bottom, width: view.frame.width-50, height: 30)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue
        
        // add imageView
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        imageView.layer.cornerRadius = 24
        imageView.center = view.center
     
        // get Images
        getRandomImage(from:  "https://source.unsplash.com/random/800x800")
   
        // add changeImageButton
        view.addSubview(button)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
}

