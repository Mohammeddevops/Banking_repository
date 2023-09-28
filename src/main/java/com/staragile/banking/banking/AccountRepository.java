package com.staragile.banking.banking;

import org.springframework.data.repository.CrudRepository;

public interface AccountRepository extends CrudRepository<Account, String> {
    // You can define custom queries or methods here if needed
}
