//
//  ViewController.swift
//  GroupDustinProposal2
//
//  Created by Heather Bishop on 4/6/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let teamMembers = ["Dustin Lay", "a", "b"]
    let components = ["Workout Helper", "Calorie Tracker", "Weight Tracker"]
    let previews = ["Home Screen", "Weight Tracker", "Calorie Tracker"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.sectionHeaderTopPadding = 12
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath else { return }

        switch segue.identifier {
        case "showMember":
            let selectedMember = teamMembers[indexPath.row]
            if let destinationVC = segue.destination as? MemberViewController {
                destinationVC.memberName = selectedMember
            }

        case "showProject":
                let selectedComponent = components[indexPath.row]
                if let destinationVC = segue.destination as? ProjectViewController {
                    destinationVC.name = selectedComponent
                }

        case "showPreview":
            let selectedPreview = previews[indexPath.row]
            if let destinationVC = segue.destination as? PreviewViewController {
                destinationVC.previewName = selectedPreview
            }

        default:
            break
        }
    }
}

extension ViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return teamMembers.count
        case 1: return components.count
        case 2: return previews.count
        default: return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        switch indexPath.section {
        case 0:
            cell.textLabel?.text = teamMembers[indexPath.row]
        case 1:
            cell.textLabel?.text = components[indexPath.row]
        case 2:
            cell.textLabel?.text = previews[indexPath.row]
        default:
            break
        }

        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Team Members"
        case 1: return "Project Components"
        case 2: return "Preview UIs"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        switch section {
        case 0: return "Member Information"
        case 1: return "Project Details"
        case 2: return "Previews of the UIs"
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        switch indexPath.section {
        case 0:
            performSegue(withIdentifier: "showMember", sender: indexPath)
        case 1:
            performSegue(withIdentifier: "showProject", sender: indexPath)
        case 2:
            performSegue(withIdentifier: "showPreview", sender: indexPath)
        default:
            break
        }
    }
}
