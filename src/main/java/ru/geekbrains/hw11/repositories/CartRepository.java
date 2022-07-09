package ru.geekbrains.hw11.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.geekbrains.hw11.model.Cart;

import java.util.List;

public interface CartRepository extends JpaRepository<Cart, Long> {
    Cart findByTitle(String title);

    @Override
    List<Cart> findAll();
}
