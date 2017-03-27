import Foundation
import SwiftyJSON
import RxSwift

public class UserData: UserDataProtocol
{
    private let requester: RequesterProcol
    
    init(requester: RequesterProcol)
    {
        self.requester = requester
    }
    
    public func signIn(username: String, password: String) -> Observable<ResponseProtocol>
    {
        let userCredentials = [
            "username": username.lowercased(),
            "passHash": password
        ]
        
        return self.requester
            .post(API.signInUrl, parameters: userCredentials)
            .filter { $0.body != nil }
            .do(onNext: { res in
                let result = JSON(res.body!)["result"]
                let username = result["username"].stringValue
                let userId = result["_id"].stringValue
                
                let userDefaults = UserDefaults.standard
                userDefaults.set(username, forKey: "user_username")
                userDefaults.set(userId, forKey: "user_id")
            })
    }
    
    public func register(username: String, password: String) -> Observable<ResponseProtocol>
    {
        let userCredentials = [
            "username": username.lowercased(),
            "passHash": password
        ]
        
        return self.requester.post(API.registerUrl, parameters: userCredentials)
    }
}
