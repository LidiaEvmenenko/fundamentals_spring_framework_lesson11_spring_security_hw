package ru.geekbrains.hw11.repositories;

import org.springframework.data.repository.CrudRepository;
import ru.geekbrains.hw11.entities.Privilege;

public interface PrivilegeRepository extends CrudRepository<Privilege, Long> {
    Privilege findByName(String name);
}
