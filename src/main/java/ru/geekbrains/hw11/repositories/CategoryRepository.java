package ru.geekbrains.hw11.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.geekbrains.hw11.model.Category;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category, Long> {
    Optional<Category> findByTitle(String title);
}
