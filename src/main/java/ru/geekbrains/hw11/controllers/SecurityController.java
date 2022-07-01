package ru.geekbrains.hw11.controllers;

import ru.geekbrains.hw11.entities.User;
import ru.geekbrains.hw11.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequiredArgsConstructor
public class SecurityController {
    private final UserService userService;

    @GetMapping("/")
    public String homePage() {
        return "home";
    }

    @GetMapping("/unsecured")
    public String usecuredPage() {
        return "unsecured";
    }

    @GetMapping("/auth_page")
    public String authenticatedPage() {
        return "authenticated";
    }

    @GetMapping("/admin")
    public String adminPage() {
        return "Вы имеете право доступа: admin";
    }

    @GetMapping("/user_info")
    public String daoTestPage(Principal principal) {
        User user = userService
                .findByUsername(principal.getName())
                .orElseThrow(() -> new RuntimeException("Unable to find user by username: " + principal.getName()));
        return "Authenticated user info: " + user.getUsername() + " : " + user.getEmail();
    }

    @GetMapping("/write")
    public String writePage() {
        return "Вы имеете право доступа: write";
    }

    @GetMapping("/delete")
    public String deletedPage() {
        return "Вы имеете право доступа: delete";
    }
}