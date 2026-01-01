import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {

    // MARK: - UI State
    @Published var title: String = ""
    @Published var dueDate: Date = Date()
    @Published var showAlert: Bool = false

    init() {}

    // MARK: - Save Todo
    func save() {
        guard canSave else {
            showAlert = true
            return
        }

        // 1️⃣ Get current user id
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }

        // 2️⃣ Create todo item
        let todoId = UUID().uuidString
        let newItem = TodoListItem(
            id: todoId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )

        // 3️⃣ Save to Firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(todoId)
            .setData(newItem.asDictionary()) { [weak self] error in
                if let error = error {
                    print("❌ Error saving todo:", error.localizedDescription)
                } else {
                    print("✅ Todo saved successfully")
                    DispatchQueue.main.async {
                        self?.title = ""
                        self?.dueDate = Date()
                    }
                }
            }
    }

    // MARK: - Validation
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        // Prevent past dates (allow today)
        guard dueDate >= Calendar.current.startOfDay(for: Date()) else {
            return false
        }

        return true
    }
}
