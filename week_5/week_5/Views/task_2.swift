import SwiftUI

struct task_2: View {
    
    struct MenuItem: Identifiable {
        var id = UUID()
        var imageName: String
        var itemTitle: String
        var price: Double
    }
    
    var menuItems: [MenuItem] = [
        MenuItem(imageName: "circle_logo", itemTitle: "Cheeseburger", price: 5.99),
        MenuItem(imageName: "circle_logo", itemTitle: "Pepperoni Pizza", price: 8.49),
        MenuItem(imageName: "circle_logo", itemTitle: "Spaghetti Carbonara", price: 7.99),
        MenuItem(imageName: "circle_logo", itemTitle: "Salmon Sushi Roll", price: 10.99),
        MenuItem(imageName: "circle_logo", itemTitle: "Cappuccino", price: 3.49),
        MenuItem(imageName: "circle_logo", itemTitle: "Chocolate Donut", price: 2.29),
        MenuItem(imageName: "circle_logo", itemTitle: "Grilled Ribeye Steak", price: 15.99),
        MenuItem(imageName: "circle_logo", itemTitle: "Caesar Salad", price: 6.79),
        MenuItem(imageName: "circle_logo", itemTitle: "Beef Tacos", price: 5.49),
        MenuItem(imageName: "circle_logo", itemTitle: "Vanilla Ice Cream", price: 4.99)
    ]
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                //Title section
                HStack {
                    Text("Title")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                            
                    Spacer()
                            
                    Image("circle_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                }
                .padding(.horizontal, geometry.size.width * 0.05)
                .padding(.top, 30)
                
                //Start of menu
                
                List(menuItems){item in
                    HStack{
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 70)
                        VStack(alignment: .leading){
                            Text(item.itemTitle)
                                .padding(.top)
                                .font(.title2)
                            Spacer()
                            Text("$" + String(item.price))
                                .padding(.bottom)
                                .font(.title2)
                        }
                        .padding(.leading)
                        
                        Spacer()
                        
                        Image("arrow-point-to-right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 50)
                            .padding()
                        
                    }
                    .listRowSeparator(.hidden)
                    .padding(.bottom, 20)
                }.listStyle(.plain)
            }
        }
    }
}

struct task_2_Previews: PreviewProvider {
    static var previews: some View {
        task_2()
    }
}
