import SwiftUI

struct task_4: View {
    @State private var isOnLoginScreen = false

    var body: some View {
        if isOnLoginScreen {
            LoginScreen(isOnLoginScreen: $isOnLoginScreen)
        } else {
            UsernameScreen(isOnLoginScreen: $isOnLoginScreen)
        }
    }
}

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // Top point
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // Bottom right
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // Bottom left
        path.closeSubpath()
        return path
    }
}

struct UsernameScreen: View {
    @Binding var isOnLoginScreen: Bool
    @State private var username: String = ""

    var body: some View {
        VStack {
            Image("circle_logo")
                .resizable()
                .frame(width: 150, height: 150)
            
            Text("Username:")
                .font(.title)
                .padding(.horizontal, 20)
                .padding(.top, 50)
            
            TextField("", text: $username)
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.horizontal, 20)
            HStack{
                Spacer()
                Button(action: {isOnLoginScreen.toggle()}){
                    Text("Next")
                        .foregroundColor(.black)
                        .frame(width: 100, height: 40)
                        .background(Color.blue.opacity(0.3))
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
                }
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 10)

            Spacer()
            
            Text("Create an account")
                .font(.title)
            Spacer()

            HStack{
                Triangle()
                    .fill(.blue.opacity(0.2))
                    .frame( width: 54,height: 45)
                    .overlay(
                        Triangle()
                            .stroke(
                                Color.gray.opacity(0.2),
                                    style: StrokeStyle(lineWidth: 2, lineJoin: .round)
                                )
                    )
                    .padding(.trailing, 20)
                Text("Forgot password")
                    .font(.title2)
                Spacer()
            }
            .padding(.horizontal, 30)
            .padding(.top, 100)
            .padding(.bottom, 20)
        }
        .padding()
    }
}

struct LoginScreen: View {
    @Binding var isOnLoginScreen: Bool
    @State private var password: String = ""

    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {
                isOnLoginScreen.toggle()
            }) {
                HStack {
                    Image(systemName: "chevron.left")
                    Text("Home")
                }
                .font(.title)
                .foregroundColor(.black)
            }
            .padding(.leading, 20)

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum nunc eu nunc tincidunt, eget vehicula ipsum cursus. Phasellus blandit orci ut diam aliquet, at malesuada arcu vehicula.")
                .font(.title2)
                .padding(20)
            
            Text("Password:")
                .font(.title)
                .padding(.horizontal, 20)
                .padding(.top, 50)
            
            TextField("", text: $password)
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 2)
                )
                .padding(.horizontal, 20)

            Button(action: {
                isOnLoginScreen.toggle()
            }) {
                Text("Login")
                    .foregroundColor(.black)
                    .frame(width: 100, height: 40)
                    .background(Color.blue.opacity(0.3))
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.black, lineWidth: 1))
            }
            .frame(maxWidth: .infinity ,alignment: .trailing)
            .padding()
            .padding(.trailing, 5)

            Spacer()
        }
        .padding()
    }
}

struct task_4_Previews: PreviewProvider {
    static var previews: some View {
        task_4()
    }
}
