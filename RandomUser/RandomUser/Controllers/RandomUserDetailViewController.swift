//
//  RandomUserDetailViewController.swift
//  RandomUser
//
//  Created by Dimitri CADARS on 18/01/2022.
//

import Foundation
import UIKit

class RandomUserDetailViewController : UIViewController {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    weak var randomUserViewModel: RandomUserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInfo()
    }
    
    private func setUpInfo() {
        self.name.text = randomUserViewModel?.name
        self.email.text = randomUserViewModel?.email
        if let pictureLarge = randomUserViewModel?.pictureLarge {
            self.userImageView.sd_setImage(with: URL(string: pictureLarge), placeholderImage: UIImage(named: "placeholder.png"))
        }
    }
    
    @IBAction func Share(_ sender: Any) {
        
        let firstActivityItem = "Share the image"

        let secondActivityItem : NSURL = NSURL(string: randomUserViewModel!.pictureLarge)!

        let activityViewController : UIActivityViewController = UIActivityViewController(
            activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
            
        activityViewController.activityItemsConfiguration = [
            UIActivity.ActivityType.message,
            UIActivity.ActivityType.mail,
            UIActivity.ActivityType.airDrop
        ] as? UIActivityItemsConfigurationReading
        
        activityViewController.isModalInPresentation = true
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
