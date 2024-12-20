import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("Shared data from UserDefaults App: ", UserDefaults.group?.string(forKey: "Shared") as Any)
    }
}
