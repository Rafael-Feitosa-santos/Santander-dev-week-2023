package br.com.dio.service;

import br.com.dio.model.User;

public interface UserService {
    User findById(Long id);

    User create(User userToCreate);
}
