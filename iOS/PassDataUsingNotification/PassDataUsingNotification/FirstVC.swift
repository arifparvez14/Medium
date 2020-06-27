import UIKit

let notificationKey = "com.arif.notificationKey"
class FirstVC: UIViewController {
        
    @IBOutlet weak var notificationTxtLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    @IBOutlet weak var goToSecondVCBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        goToSecondVCBtn.layer.cornerRadius = 10
        notificationTxtLbl.text = "Didn't notify yet 🙁"
        infoLbl.text = "Name and Age not set. Go to SecondVC to set them."
        
        //Observe notification
        NotificationCenter.default.addObserver(self,selector: #selector(doWhenNotify(_:)),name: Notification.Name(rawValue: notificationKey),object: nil)
        
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @IBAction func goToSecondVCTap(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "SecondVC")
        navigationController?.pushViewController(vc, animated: true)
    }
    //Do after notify
    @objc func doWhenNotify(_ notification: NSNotification){
        notificationTxtLbl.text = "Notified 😃"

        if let dict = notification.userInfo as NSDictionary? {
            if let name = dict["name"] as? String, let age = dict["age"] as? String{
                infoLbl.text = "Hi \(name), you are \(age) years old"
            }
        }
    }
}
