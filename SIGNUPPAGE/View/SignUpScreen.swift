
// Designed SignUp screen in tableView

import UIKit

class SignUpScreen: UIViewController {
    
    // MARK: - Outlets and variables
    
    var details:[String] = ["First name" , "Last name" , "Mobile number" , "Identification card" , "Identification number" , "Permanant address" , "Address line 2" , "City"]
    
    var details2:[String] = ["State" , "Pincode"]
    
    var details3:[String] = ["Communication address" , "Address line 2" , "City"  , "State" , "Pincode"]
    
    @IBOutlet weak var studentDetailTableView: UITableView!
    
    @IBAction func backToScrollView(_ sender: Any) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "ViewController") as? ViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        print("Button Clicked 2")
    }
   
    // MARK: - LifeCycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.studentDetailTableView.delegate = self
        self.studentDetailTableView.dataSource = self
        self.registerTableViewCells()

    }
    
    // MARK: - setUp Method
    
    private func registerTableViewCells() {
        
        let textFieldCell = UINib(nibName: "UserDetailsCell", bundle: nil)
        self.studentDetailTableView.register(textFieldCell , forCellReuseIdentifier: "UserDetailsCell")
        
        let noteViewCell = UINib(nibName: "NoteCustomCell" , bundle: nil)
        self.studentDetailTableView.register(noteViewCell , forCellReuseIdentifier: "NoteCustomCell")
        
        let labelCell = UINib(nibName: "ConfirmationMsgCell" , bundle: nil)
        self.studentDetailTableView.register(labelCell , forCellReuseIdentifier: "ConfirmationMsgCell")
        
        let OTPLblCell = UINib(nibName: "OTPLblCell" , bundle: nil)
        self.studentDetailTableView.register(OTPLblCell , forCellReuseIdentifier: "OTPLblCell")
        
        let buttonCell = UINib(nibName: "ContinueBtnCell" , bundle: nil)
        self.studentDetailTableView.register(buttonCell , forCellReuseIdentifier: "ContinueBtnCell")
    
    }
    
}

// MARK: - TableView Method

extension SignUpScreen: UITableViewDelegate , UITableViewDataSource {

func numberOfSections(in tableView: UITableView) -> Int {

    return 7
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

    if section == 0{
        return 1
    }
    if section == 1{
        return 8
    }
    if section == 2{
        return 1
    }
    if section == 3{
        return 2
    }
    if section == 4{
        return 1
    }
    if section == 5{
        return 5
    }
    if section == 6{
        return 1
    } else{
        return 0
    }
}
    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{ // Note view
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCustomCell", for: indexPath) as? NoteCustomCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 1{ // first eight details
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsCell", for: indexPath) as? UserDetailsCell else {
                return UITableViewCell()
            }
            cell.detailsLabel.text = details[indexPath.row]
            
            return cell
        }else if indexPath.section == 2{// to dispaly label2
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "OTPLblCell", for: indexPath) as? OTPLblCell else {
                return UITableViewCell()
            }
            return cell
        }else if indexPath.section == 3{ // next 2 details
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsCell", for: indexPath) as? UserDetailsCell else {
                return UITableViewCell()
            }
            cell.detailsLabel.text = details2[indexPath.row]
            return cell
        } else if indexPath.section == 4{ // display use thi label
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ConfirmationMsgCell", for: indexPath) as? ConfirmationMsgCell else {
                return UITableViewCell()
            }
            return cell
        } else if indexPath.section == 5{ // last five details
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsCell", for: indexPath) as? UserDetailsCell else {
                return UITableViewCell()
            }
            cell.detailsLabel.text = details3[indexPath.row]
            return cell
        }else if indexPath.section == 6{ // button
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ContinueBtnCell", for: indexPath) as? ContinueBtnCell else {
                
                return UITableViewCell()
            }
            cell.buttonPressed = {
                let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                        let vc = storyBoard.instantiateViewController(withIdentifier: "UserDetailsScreen") as? UserDetailsScreen
                        self.navigationController?.pushViewController(vc!, animated: true)
            }
            return cell
        }
    
    return UITableViewCell()
}

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsCell") as? UserDetailsCell
//        cell.contentInset = UIEdgeInsets(top: 70, left: 0, bottom: 50, right: 0)
//        return 50.0
//
//    }
}
