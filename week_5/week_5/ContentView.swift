import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Task 1", destination: Task1View())
                NavigationLink("Task 2", destination: Task2View())
                NavigationLink("Task 3", destination: Task3View())
                NavigationLink("Task 4", destination: Task4View())
            }
            .navigationTitle("Select Task")
        }
    }
}

struct Task1View: View {
    var body: some View {
        task_1()
    }
}

struct Task2View: View {
    var body: some View {
        task_2()
    }
}

struct Task3View: View {
    var body: some View {
        task_3()
    }
}

struct Task4View: View {
    var body: some View {
        task_4()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
