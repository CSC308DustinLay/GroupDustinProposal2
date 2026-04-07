//
//  ProjectViewController.swift
//  GroupDustinProposal2
//
//  Created by Heather Bishop on 4/6/26.
//

import UIKit

class ProjectViewController: UIViewController
{
    @IBOutlet weak var projectDetailName: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var name: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name else { return }
        projectDetailName.text = name
        changeInfo(detailName: name)
    }
    
    func changeInfo(detailName: String)
    {
        switch detailName {
        case "Workout Helper":
            detailLabel.text = """
        Scope/Deliverables:
            - Select workout types
            - Input workout data (duration, reps, etc.)
            - Calculate estimated calories burned
        Interface:
            - Images/icons for each workout
            - Input fields for data entry
            - Output label for calories burned
        Risks/Dependencies/Milestones:
            - Need reliable calorie calculation method
            - Must implement data persistence
            - Data used by Calorie Tracker
        """

        case "Calorie Tracker":
            detailLabel.text = """
        Scope/Deliverables:
            - Track calories consumed
            - Display calories burned
            - Calculate net calories
        Interface:
            - Input field for calories consumed
            - Label for calories burned
            - Button to calculate net calories
            - Output label for result
        Risks/Dependencies/Milestones:
            - Depends on Workout Helper data
            - Low risk if data flow works correctly
        """

        case "Weight Tracker":
            detailLabel.text = """
        Scope/Deliverables:
            - Track daily weight
            - Organize by week
        Interface:
            - TableView with weekly sections
            - Rows for each day
            - Selectable cells to edit weight
        Risks/Dependencies/Milestones:
            - Requires data persistence
            - Handle user input and cell updates
            - Consider long-term data storage
        """

        default:
            detailLabel.text = "N/A"
        }
    }
}
