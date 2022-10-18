import Alamofire


protocol BaseAPIService {
    func get(url: String, headers: [String: String], queryMap: [String: Any]) async -> NetworkResult
}

struct NetworkResult {
    
}

class NetworkService: BaseAPIService {
    func get(url: String, headers: [String: String] = [String:String](), queryMap: [String: Any] = [String:Any]()) async {
        
        var newHeaders:[String: String] = ["Accept":"application/json"]
        // combine with passed in headers, overriding defaults
        newHeaders.merge(headers, uniquingKeysWith: {(_, new) in new })
        let mergedHeaders = HTTPHeaders.init(newHeaders)
        let response = await AF.request(url, headers: mergedHeaders).serializingDecodable(Joke.self).response

        print(response.error)
        print(response.value)
    }
}

