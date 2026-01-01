import FirebaseFirestore
import SwiftUI

struct TodoListView: View {
    @StateObject var viewModel = TodoListViewViewModel()
    private let userId: String
    @FirestoreQuery var items: [TodoListItem]
    
    init(userId:String) {
        self.userId = userId
        // user id for fetching todolist item
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // List view content here
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // ACTION
                    viewModel.showingNewViewItem = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewViewItem) {
                NewItemView(newItemPresented: $viewModel.showingNewViewItem)
                
                
            }
        }
    }
}

#Preview {
    TodoListView(userId: "")
}
