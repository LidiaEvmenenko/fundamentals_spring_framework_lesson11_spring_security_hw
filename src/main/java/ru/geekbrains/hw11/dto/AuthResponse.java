package ru.geekbrains.hw11.dto;

import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@Data
public class AuthResponse {
    private String token;
    private String message;

    public AuthResponse(String token, String message) {
        this.message = message;
        this.token = token;
    }
}
