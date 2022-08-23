
import Foundation

struct Parser {


    func getData(comp : @escaping ([Article]) -> ()) {
        let urlString = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=249bb275978744b5af96f9b514faa055"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration, delegate: nil, delegateQueue: OperationQueue.main)

        let task = session.dataTask(with: request) { data, response, error in
            if error != nil {
                print("error")

            } else {
                let result = try! JSONDecoder().decode(Welcome.self, from: data!)
                comp(result.articles)
                                      print(result)
            }
            }
        task.resume()
    }
}
