
// SignUp screen using ScrollView

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var signupScroll: UIScrollView!
    
    @IBAction func continueButtonActiobn(_ sender: UIButton) {
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = storyBoard.instantiateViewController(withIdentifier: "SignUpScreen") as? SignUpScreen
                self.navigationController?.pushViewController(vc!, animated: true)
        print("Button Clicked")
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
    }
//    override func viewWillLayoutSubviews(){
//        super.viewWillLayoutSubviews()
//            scrollView.contentSize = CGSize(width: 450, height: 1940)
//        }

   
}

