package com.project.msm.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class RegisterRequestValidator implements Validator {
	
	private static final String emailRegExp = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" +
		            "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	private Pattern pattern;
	
	public RegisterRequestValidator() {
		pattern = Pattern.compile(emailRegExp);
	}
	
	@Override
	public boolean supports(Class<?> clazz) {
		return RegisterRequest.class.isAssignableFrom(clazz);
	}
	
	@Override
    public void validate(Object target, Errors errors) {
        RegisterRequest regReq = (RegisterRequest) target;
        
        if(regReq.getmEmail() == null || regReq.getmEmail().trim().isEmpty()) {
            errors.rejectValue("mEmail", "required", "필수 정보 입니다.");
        } else {
            Matcher matcher = pattern.matcher(regReq.getmEmail());
            if(!matcher.matches()) {
                errors.rejectValue("mEmail", "bad", "올바르지 않는 형식입니다.");
            }
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mName", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmpty(errors, "mPw", "required", "필수 정보 입니다.");
        ValidationUtils.rejectIfEmpty(errors, "checkPw", "required", "필수 정보 입니다.");
        if(!regReq.getmPw().isEmpty()) {
            if(!regReq.isPwEqualToCheckPw()) {
                errors.rejectValue("checkPw", "nomatch", "비밀번호가 일치하지 않습니다.");
            }
        }
    }




}
