

import UIKit

class ContinueBtnCell: UITableViewCell {
    
  
    var buttonPressed : (() -> ()) = {}
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func buttonCellAction(_ sender: Any) {
       buttonPressed()
        
    }
}
