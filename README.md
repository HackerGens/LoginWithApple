# Login With Apple in ios 14.You can use this code in swiftui.

        VStack {
            if #available(iOS 14.0, *) {
                SignInWithAppleButton(
                    .signIn,
                    onRequest: { request in
                        // 1
                        request.requestedScopes = [.fullName, .email]
                        
                        let appleIDProvider = ASAuthorizationAppleIDProvider()
                            let request = appleIDProvider.createRequest()
                            request.requestedScopes = [.fullName, .email]
                    },
                    
                    onCompletion: { (result) in
                        switch result {
                        case .success(let authorization):
                            //Handle autorization
                            
                            if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
                                let userId = appleIDCredential.user
                                let identityToken = appleIDCredential.identityToken
                                let authCode = appleIDCredential.authorizationCode
                                let email = appleIDCredential.email
                                let givenName = appleIDCredential.fullName?.givenName
                                let familyName = appleIDCredential.fullName?.familyName
                                let state = appleIDCredential.state
                                
                                print(userId)
                                print(identityToken)
                                print(authCode)
                                print(email)
                                print(givenName)
                                print(familyName)
                                print(state)
                                // Here you have to send the data to the backend and according to the response let the user get into the app.
                              
                            }
                            break
                        case .failure(let error):
                            //Handle error
                            break
                        }
                    }
                )
            } else {
                // Fallback on earlier versions
            }
        }.frame(width:300,height: 60).background(Color.orange.opacity(0.4)).cornerRadius(10).padding([.top], 5)
