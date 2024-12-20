import UIKit

struct CustomModel: Codable {
    let name: String
    let age: Int
}

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        saveData()
        loadData()
    }

    private func saveData() {
        UserDefaults.standard.set(true, forKey: "Bool")
        UserDefaults.standard.set("UserDefaults", forKey: "String")
        UserDefaults.standard.set(1, forKey: "Int")
        UserDefaults.standard.set(1.2, forKey: "Double")
        UserDefaults.standard.set(1.25, forKey: "Float")
        UserDefaults.standard.set([1, 2], forKey: "Array")
        UserDefaults.standard.set(["one": 1], forKey: "Dictionary")
        UserDefaults.standard.set(URL(string: "https://www.gooogle.com")!, forKey: "URL")

        let data = "1".data(using: .utf8)
        UserDefaults.standard.set(data, forKey: "Data")

        let customModel = CustomModel(name: "ABC", age: 40)
        let encodedObject = try? JSONEncoder().encode(customModel)
        UserDefaults.standard.setValue(encodedObject, forKey: "CustomModel")

        UserDefaults.group?.set("This is shared data", forKey: "Shared")
    }

    private func loadData() {
        print("Bool: ", UserDefaults.standard.bool(forKey: "Bool"))
        print("String: ", UserDefaults.standard.string(forKey: "String") as Any)
        print("Int: ", UserDefaults.standard.integer(forKey: "Int"))
        print("Double: ", UserDefaults.standard.double(forKey: "Double"))
        print("Float: ", UserDefaults.standard.double(forKey: "Float"))
        print("Array: ", UserDefaults.standard.array(forKey: "Array") as Any)
        print("Dictionary: ", UserDefaults.standard.dictionary(forKey: "Dictionary") as Any)
        print("URL: ", UserDefaults.standard.url(forKey: "URL") as Any)
        print("Data: ", String(data: UserDefaults.standard.data(forKey: "Data") ?? Data(), encoding: .utf8) as Any)
        let customModelData = UserDefaults.standard.data(forKey: "CustomModel") ?? Data()
        let customModel = try? JSONDecoder().decode(CustomModel.self, from: customModelData)
        print("CustomModel: ", customModel as Any)

        print("Shared Data: ", UserDefaults.group?.string(forKey: "Shared") as Any)
    }
}
