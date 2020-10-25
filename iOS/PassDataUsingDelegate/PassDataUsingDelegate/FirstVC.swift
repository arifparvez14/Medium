
import UIKit
class FirstVC: UIViewController {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var goBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "FirstVC"
        goBtn.layer.cornerRadius = 10
    }
    @IBAction func goBtnTap(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "SecondVC") as! SecondVC
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension FirstVC: UserInfo {
    func userDidSetInfo(image: UIImage, name: String) {
        userNameLabel.text = "Hello \(name), your picked image size is \(image.size.width) * \(image.size.height)"
    }
}
