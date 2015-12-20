import Foundation
import ReactiveCocoa
import Result

let (signal, observer) = Signal<String, NoError>.pipe()

/// Does not forward any values from `self` until `trigger` sends a Next or
/// Completed event, at which point the returned signal behaves exactly like
/// `signal`.

UITextField()

let searchStrings = textField.rac_textSignal()
    .toSignalProducer()
    .map { text in text as! String }