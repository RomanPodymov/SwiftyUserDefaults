//
// SwiftyUserDefaults
//
// Copyright (c) 2015-present Radosław Pietruszewski, Łukasz Mróz
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import Foundation

public protocol DataStorage: AnyObject {
    func object(forKey: String) -> Any?
    func array(forKey: String) -> [Any]?
    func dictionary(forKey: String) -> [String : Any]?
    func string(forKey: String) -> String?
    func bool(forKey: String) -> Bool
    func data(forKey aKey: String) -> Data?
    func double(forKey: String) -> Double
    func dictionaryRepresentation() -> [String : Any]
    
    func set(_: Any?, forKey: String)
    func set(_: Double, forKey: String)
    func set(_: Bool, forKey: String)

    func removeObject(forKey: String)
}

extension UserDefaults: DataStorage { }

extension NSUbiquitousKeyValueStore: DataStorage {
    public func dictionaryRepresentation() -> [String : Any] {
        return dictionaryRepresentation
    }
}
