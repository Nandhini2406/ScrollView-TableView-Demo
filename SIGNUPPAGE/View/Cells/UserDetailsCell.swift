
import UIKit

class UserDetailsCell: UITableViewCell {

    
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var detailTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
