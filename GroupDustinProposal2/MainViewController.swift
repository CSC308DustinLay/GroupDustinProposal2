//
//  ViewController.swift
//  GroupDustinProposal2
//
//  Created by Heather Bishop on 4/6/26.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let teamMembers = ["Dustin Lay"]
    let components = ["Login System", "Dashboard", "API Layer"]
    let previews = ["Home Screen UI"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.contentInset.top = 10
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = sender as? IndexPath else { return }

        switch segue.identifier {
        case "showMember":
            let selectedMember = teamMembers[indexPath.row]
            print(selectedMember)

        case "showProject":
            let selectedComponent = components[indexPath.row]
            print(selectedComponent)

        case "showPreview":
            let selectedPreview = previews[indexPath.row]
            print(selectedPreview)

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
