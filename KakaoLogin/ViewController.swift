//
//  ViewController.swift
//  KakaoLogin
//
//  Created by 남오승 on 2020/09/30.
//

import UIKit
import KakaoSDKAuth
import KakaoSDKUser

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func kakaoLoginBtn(_ sender: Any) {

        AuthApi.shared.loginWithKakaoAccount {(oauthToken, error) in
            if let error = error {
                print(error)
            }
            else {
                print("loginWithKakaoAccount() success.")

                //do something
                _ = oauthToken
            }
        }
    }
    
    //해당 디바이스 카카오 로그아웃시킴
    @IBAction func kakaoLogout(_ sender: Any) {
        UserApi.shared.logout {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("로그아웃 성공")
            }
        }
    }
    
    //카카오톡 설치여부 확인
    @IBAction func kakaoInstallFlagBtn(_ sender: Any) {
        if(AuthApi.isKakaoTalkLoginAvailable()) {
            print("카카오톡 설치됨")
        }else {
            print("카카오톡 미설치됨")
        }
    }
    
    @IBAction func kakaoUserDisconnectBtn(_ sender: Any) {
        UserApi.shared.unlink {(error) in
            if let error = error {
                print(error)
            }
            else {
                print("계정 Disconnect성공")
            }
        }
        
    }
    
}

