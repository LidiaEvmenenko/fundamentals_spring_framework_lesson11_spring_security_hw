package ru.geekbrains.hw11.entities;

import lombok.Data;
import javax.persistence.*;
import java.util.Collection;

@Entity
@Data
@Table(name = "privileges")
public class Privilege {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String name;

    @ManyToMany()
    @JoinTable(name = "roles_privileges",
            joinColumns = @JoinColumn(name = "privilege_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Collection<Role> roles;
}
