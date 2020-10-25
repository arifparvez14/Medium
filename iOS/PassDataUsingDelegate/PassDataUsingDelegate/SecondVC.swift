
import UIKit
protocol UserInfo {
    func userDidSetInfo(image: UIImage, name: String)
}

class SecondVC: UIViewController {

    @IBOutlet weak private var nameTextField: UITextField!
    @IBOutlet weak private var profileImageView: UIImageView!
    @IBOutlet weak private var setBtn: UIButton!

    var delegate: UserInfo?
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "SecondVC"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Set Image", style: .plain, target: self, action: #selector(rightBarButtonTap))

        setBtn.layer.cornerRadius = 10
        self.profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2
        self.profileImageView.clipsToBounds = true
    }

    @objc private func rightBarButtonTap(){
        ImagePickerManager().pickImage(self){image in
            self.profileImageView.image = image
        }
    }

    @IBAction func setBtnTap(_ sender: Any) {
        if !(profileImageView.image?.isSymbolImage ?? false) && nameTextField.text != "" {
            delegate?.userDidSetInfo(image: profileImageView.image!, name: nameTextField.text!)
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "User info not set", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.destructive, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
