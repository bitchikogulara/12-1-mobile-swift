import SwiftUI

struct task_1: View {
    var body: some View {
        GeometryReader { geometry in
            VStack{
                HStack {
                    Text("Title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                            
                    Spacer() // Pushes the image to the right
                            
                    Image("circle_logo")
                        .resizable()  // Makes image resizable
                        .scaledToFit() // Maintains aspect ratio
                        .frame(width: 50, height: 50) // Adjust size
                }
                .padding(.horizontal, geometry.size.width * 0.05)
                .padding(.top, 30)
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.yellow)
                    .frame(width: geometry.size.width * 0.9, height: 250)
                
                //Spacer()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla condimentum nunc eu nunc tincidunt, eget vehicula ipsum cursus. Phasellus blandit orci ut diam aliquet, at malesuada arcu vehicula.")
                    .padding(.horizontal, geometry.size.width * 0.05)
                    .padding(.vertical, 30)
                    .font(.title2)
                
                //Spacer()
                
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.yellow)
                    .frame(width: geometry.size.width * 0.9, height: 200)
            }
        }
    }
}

struct task_1_Previews: PreviewProvider {
    static var previews: some View {
        task_1()
    }
}
