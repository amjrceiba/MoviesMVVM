//
//  Networking.swift
//  MoviesMVC
//
//  Created by Andrés Mauricio Jaramillo Romero - Ceiba Software on 15/06/21.
//

import Foundation
import Alamofire
import SwiftyJSON

public class Networking {
    
    let preferences: Preferences?
    let queue = DispatchQueue(label: "com.ceiba.MoviesMVVM", qos: .background, attributes: .concurrent)
    
    init() {
        let path = Bundle.main.path(forResource: "Preferences", ofType: "plist")
        let xml = FileManager.default.contents(atPath: path!)
        self.preferences = try? PropertyListDecoder().decode(Preferences.self, from: xml!)
    }
    
    func get(url: String, completion: @escaping(AFDataResponse<Any>)->Void){
        var request = URLRequest(url: URL(string: url)!)
        request.httpMethod = HTTPMethod.get.rawValue
        request.setValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")

        AF.request(request).responseJSON(queue: queue) { response in
            completion(response)
        }
    }
}


