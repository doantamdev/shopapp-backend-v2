package com.project.shopapp.utils;

import java.util.regex.Pattern;

public class ValidationUtils {

    public static boolean isValidEmail(String email) {
        // Regular expression pattern for validating email addresses
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";
        // Create a Pattern object
        Pattern pattern = Pattern.compile(emailRegex);
        // Match the input email with the pattern
        return email != null && pattern.matcher(email).matches();
    }

    public static boolean isValidPhoneNumber(String phoneNumber) {
        // Regular expression pattern for validating phone numbers
        // Valid if contains only numbers, at least 6 characters
        String phoneRegex = "^\\d{6,}$";
        // Create a Pattern object
        Pattern pattern = Pattern.compile(phoneRegex);
        // Match the input phone number with the pattern
        return phoneNumber != null && pattern.matcher(phoneNumber).matches();
    }
    public static boolean isValidPassword(String password) {
        // Password validation: At least 3 characters
        return password != null && password.length() >= 3;
    }
}
