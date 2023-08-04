
import UIKit

class UserDetailsScreen: UIViewController {
    
    
    // MARK: - Outlet and Variables
    
    @IBAction func backToBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBOutlet weak var sampleMvvmTableView: UITableView!
    var viewModel = Parser()
    
    // MARK: - Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerNIb()
        setup()
    }
    
    // MARK: - Setup methods
    func setup(){
        
        self.sampleMvvmTableView.delegate = self
        self.sampleMvvmTableView.dataSource = self
      
        self.viewModel.parser{
            DispatchQueue.main.async {
                self.sampleMvvmTableView.reloadData()
            }
        }
    }

    func registerNIb(){
        sampleMvvmTableView.register(UINib(nibName: "UsersNameCell", bundle: nil), forCellReuseIdentifier: "UsersNameCell")
    }
}

// MARK: - Tableview methods
extension UserDetailsScreen: UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.students.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersNameCell" , for: indexPath)
        let student = viewModel.students[indexPath.row]
        print("student data .......\(student)")
        cell.textLabel?.text = student
        return cell
    }
    
}


