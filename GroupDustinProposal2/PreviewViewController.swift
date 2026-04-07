//
//  PreviewViewController.swift
//  GroupDustinProposal2
//
//  Created by Heather Bishop on 4/7/26.
//

import UIKit

class PreviewViewController: UIViewController
{
    @IBOutlet weak var previewUINavItem: UINavigationItem!
    @IBOutlet weak var previewImage: UIImageView!
    
    var previewName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let previewName else { return }
        previewUINavItem.title = previewName
        changeImage(previewName: previewName)
    }
    //let previews = ["Home Screen", "Weight Tracker", "Calorie Tracker"]
    func changeImage(previewName: String)
    {
        switch previewName
        {
        case "Home Screen":
            previewImage.image = UIImage(named: "MainScreen")
        case "Weight Tracker":
            previewImage.image = UIImage(named: "WeightTracker")
        case "Calorie Tracker":
            previewImage.image = UIImage(named: "CalorieTracker")
        default:
            break
        }
    }
}
