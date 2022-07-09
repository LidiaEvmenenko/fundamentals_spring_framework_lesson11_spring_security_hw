package ru.geekbrains.hw11.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.geekbrains.hw11.model.Product;

public interface ProductRepository extends JpaRepository<Product, Long>{
}
