//
//  Extensions.swift
//  ToDoList
//
//  Created by Umesh Sahoo on 12/10/25.
//

import Foundation

extension Encodable {
    func asDictionary() -> [String: Any] {
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }

        let json = try? JSONSerialization.jsonObject(with: data)
        return json as? [String: Any] ?? [:]
    }
}
