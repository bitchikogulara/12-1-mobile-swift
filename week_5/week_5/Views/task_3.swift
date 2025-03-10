import SwiftUI

struct task_3: View {
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
    
    @State private var username : String = "";
    @State private var password : String = "";
    
    var body: some View {
        VStack{
            Image("circle_logo")
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .padding(.bottom, 40)
                .padding(.top, 30)
                
            HStack{
                Text("Username:")
                    .font(.title)
                Spacer()
                TextField("",text:$username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150, height: 40)
                    .padding(5)
            }
            .padding(.horizontal, 50)
            HStack{
                Text("Password:")
                    .font(.title)
                Spacer()
                TextField("",text:$password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 150, height: 40)
                    .padding(5)
            }
            .padding(.horizontal, 50)
            HStack{
                Spacer()
                Button(action: {}){
                    Text("Login")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding(5)
                        .frame(width: 100)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                }
                
            }
            .padding(.horizontal, 55)
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
            .padding(.top, 80)
            .padding(.bottom, 20)
                
            
        }
    }
}

struct task_3_Previews: PreviewProvider {
    static var previews: some View {
        task_3()
    }
}
