
import Foundation

class Parser:NSObject {
    
    var students : [String] = []
    
    func parser(completion: @escaping () -> Void){
        
        let url = URL(string: "https://crudcrud.com/api/06f4ee44808d4ed6bfdfafdaf4e61086")!
        var request = URLRequest(url: url)
                request.httpMethod = "GET"
                let dataTask = URLSession.shared.dataTask(with: request) {
                data,response,error in
                    if error != nil {
                        print("Error")
                            // Handle HTTP request error
                        }
                    guard let data = data else{
                        print("NO data found")
                        return
                    }
                
                    if let responseData = String(data: data, encoding: .utf8){
                        print("Response ......... \(responseData)")
                    }
                    
                    let decoder = JSONDecoder()
                    do {
                        let decp = try decoder.decode([String].self, from: data)
                        print("decoder \(decp)")
                        self.students = decp
//                        self.students = try decoder.decode([Students].self, from: data)
                        completion()
                        
                        } catch {
                            print(error)
                            
                        }
                }
                .resume()

            }

    }
    

