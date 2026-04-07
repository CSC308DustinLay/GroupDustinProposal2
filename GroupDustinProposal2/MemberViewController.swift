//
//  MemberViewController.swift
//  GroupDustinProposal2
//
//  Created by Heather Bishop on 4/7/26.
//

import UIKit

class MemberViewController: UIViewController
{
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var responseLabel: UILabel!
    @IBOutlet weak var deadlineLabel: UILabel!
    @IBOutlet weak var riskLabel: UILabel!
    
    var memberName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let memberName else { return }
        memberNameLabel.text = memberName
        changeInfo(memName: memberName)
    }
    
    func changeInfo(memName: String)
    {
        switch memName
        {
        case "Dustin Lay":
            responseLabel.text = "Everything"
            deadlineLabel.text = "May 7th"
            riskLabel.text = "As I am the only person on my team my biggest risk is not being able to complete the work load alone."
        case "a":
            responseLabel.text = "Nothing"
            deadlineLabel.text = "The end of the universe"
            riskLabel.text = "None"
        case "b":
            responseLabel.text = "Nothing"
            deadlineLabel.text = "The end of the universe"
            riskLabel.text = "None"
        default:
            responseLabel.text = "N/A"
            deadlineLabel.text = "N/A"
            riskLabel.text = "N/A"
        }
    }
}
