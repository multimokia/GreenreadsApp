//
//  SignupFormData.swift
//  Greenreads
//
//  Created by Misty D'mello on 2023-03-23.
//

import Foundation
struct SignupFormData {
    var username: String = "";
    var email: String = "";
    var password: String = "";
    var confirmPassword: String = "";
    var firstName: String = "";
    var lastName: String = "";
    var gender = Gender.male;
    var isOver18: Bool = false;
    var hasAgreed: Bool = false;
}
