import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewViewModel: ObservableObject {

    // MARK: - UI State
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var isLoading: Bool = false

    init() {}

    // MARK: - Register
    func register() {
        guard validate() else {
            errorMessage = "Please fill all fields correctly"
            return
        }

        isLoading = true
        errorMessage = ""

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            DispatchQueue.main.async {
                self?.isLoading = false
            }

            if let error = error {
                DispatchQueue.main.async {
                    self?.errorMessage = error.localizedDescription
                }
                return
            }

            guard let userId = result?.user.uid else {
                DispatchQueue.main.async {
                    self?.errorMessage = "User ID not found"
                }
                return
            }

            self?.insertUserRecord(userId: userId)
        }
    }

    // MARK: - Firestore
    private func insertUserRecord(userId: String) {
        let newUser = User(
            id: userId,
            name: name,
            email: email,
            joined: Date().timeIntervalSince1970
        )

        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .setData(newUser.asDictionary()) { [weak self] error in
                if let error = error {
                    DispatchQueue.main.async {
                        self?.errorMessage = error.localizedDescription
                    }
                }
            }
    }

    // MARK: - Validation
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }

        guard email.contains("@"), email.contains(".") else {
            return false
        }

        guard password.count >= 6 else {
            return false
        }

        return true
    }
}
