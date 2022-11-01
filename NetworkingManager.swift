//
//  NetworkingManager.swift
//  EasyCookApp
//
//  Created by Lunack on 24/10/2022.
//

import Foundation

final class NetworkingManager {
    
 static let shared = NetworkingManager()
    

    
  
    func request(methodeType:MethodeType, url: String, completion: @escaping((Result<Void,Error>) -> Void)){
        
        // formatage de l'url
        guard let url = URL(string: url) else {
            return
        }
        
        // fabrication de la requete
        let request = buildRequest(from: url, methodeType: methodeType)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            
            
            if error != nil {
                completion(.failure(NetworkingError.custom(error: error!)))
                return
            }
            
            // on regarde notre status Code
            guard let res  = response as? HTTPURLResponse,
                  (200...300) ~= res.statusCode else {
                let statusCode = (response as! HTTPURLResponse).statusCode
                completion(.failure(NetworkingError.invalidStatusCode(statusCode: statusCode)))
                return
            }
        
            
            //guard let data = data else {
            //    completion(.failure(NetworkingError.invalidData))
            //    print("ERREUR DE RESEAU")
            //    return
            //}
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print("Response data string:\n \(dataString)")
            }
            
            completion(.success(()))
            
            
       
        }
        
        dataTask.resume()
            
            
            
        }
         
}



extension NetworkingManager {
    enum NetworkingError: Error {
        case invalidUrl
        case custom(error: Error)
        case invalidStatusCode(statusCode: Int)
        case invalidData
        case failedToDecode(error:Error)
    }
}

private extension NetworkingManager {
    // construire la requête
    func buildRequest(from url:URL,methodeType: MethodeType) -> URLRequest{
        var request = URLRequest(url: url)
        
        //let authData = ("julien:123456").data(using: .utf8)!.base64EncodedString()
        //request.addValue("Basic \(authData)", forHTTPHeaderField: "Authorization")
        switch methodeType {
        case .GET:
            request.httpMethod = "GET"
        case .POST(let data):
            request.httpMethod = "POST"
           /* request.addValue("0", forHTTPHeaderField:"Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("Julien", forHTTPHeaderField: "USERNAME")
            request.setValue("123456", forHTTPHeaderField: "PASSWORD")*/
            //request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
             //   request.addValue("Basic " + base64LoginString, forHTTPHeaderField: "Authorization")
             //   request.addValue("application/json", forHTTPHeaderField: "Accept")
             //   request.setValue("0", forHTTPHeaderField: "Content-Length")
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = data
        }
        return request
    }
    
    
}

extension NetworkingManager {
    enum MethodeType {
        case GET
        case POST(data:Data?)
    }
}
