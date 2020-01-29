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
            errors.rejectValue("mEmail", "required", "�ʼ� ���� �Դϴ�.");
        } else {
            Matcher matcher = pattern.matcher(regReq.getmEmail());
            if(!matcher.matches()) {
                errors.rejectValue("mEmail", "bad", "�ùٸ��� �ʴ� �����Դϴ�.");
            }
        }
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "mName", "required", "�ʼ� ���� �Դϴ�.");
        ValidationUtils.rejectIfEmpty(errors, "mPw", "required", "�ʼ� ���� �Դϴ�.");
        ValidationUtils.rejectIfEmpty(errors, "checkPw", "required", "�ʼ� ���� �Դϴ�.");
        if(!regReq.getmPw().isEmpty()) {
            if(!regReq.isPwEqualToCheckPw()) {
                errors.rejectValue("checkPw", "nomatch", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
            }
        }
    }




}
