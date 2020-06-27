
import UIKit

class SecondVC: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var enterNameTF: UITextField!
    @IBOutlet weak var enterAgeTF: UITextField!
    @IBOutlet weak var submitBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.layer.cornerRadius = 10
        submitBtn.layer.cornerRadius = 10
    }
    
    @IBAction func submitBtnTap(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        var info = [String: String]()
        info["name"] = enterNameTF.text
        info["age"] = enterAgeTF.text
        NotificationCenter.default.post(name: Notification.Name(rawValue: notificationKey), object: nil, userInfo: info)
    }
}
