import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {

                Spacer()

                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Logout")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Profile Details")
        }
    }
}

#Preview {
    ProfileView()
}
