import UIKit

fileprivate let key: String = "feat_six"

@propertyWrapper
class FeatureToggleWrapper {
    
    private var keys: [String: Bool] = ["feat_one": true,
                                        "feat_two": false,
                                        "feat_three": true,
                                        "feat_four": false,
                                        "feat_five": true]
    
    let key: String
    
    var wrappedValue: Bool {
        keys[key] ?? false
    }
    
    init(key: String) {
        self.key = key
    }
    
}

extension FeatureToggleWrapper {
    func addNew(key: String, value: Bool) {
        self.keys[key] = value
    }
}

struct FeatureToggleDemo {
    
    @FeatureToggleWrapper(key: key)
    var featureToggleHome: Bool
    
    func getValue() -> String {
        return "\(key): \(featureToggleHome)"
    }
    
    func addNewToggle() {
        _featureToggleHome.addNew(key: "feat_six", value: true)
    }
    
}

let demo = FeatureToggleDemo()
demo.addNewToggle()
demo.getValue()
