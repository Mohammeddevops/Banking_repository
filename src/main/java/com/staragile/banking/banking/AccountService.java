package com.staragile.banking.banking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class AccountService {

    @Autowired
    private AccountRepository accountRepository;

    public List<Account> getAllAccounts() {
        List<Account> accountList = new ArrayList<>();
        accountRepository.findAll().forEach(accountList::add);
        return accountList;
    }

    public Optional<Account> getAccountByAccountNumber(String accountNumber) {
        return accountRepository.findById(accountNumber);
    }

    public void addAccount(Account account) {
        accountRepository.save(account);
    }

    public void updateAccount(String accountNumber, Account updatedAccount) {
        // Check if the account with the specified accountNumber exists
        Optional<Account> existingAccount = accountRepository.findById(accountNumber);
        if (existingAccount.isPresent()) {
            // Update the account details
            Account accountToUpdate = existingAccount.get();
            accountToUpdate.setCustomerName(updatedAccount.getCustomerName());
            accountToUpdate.setCustomerAddress(updatedAccount.getCustomerAddress());
            accountToUpdate.setContactNumber(updatedAccount.getContactNumber());

            // Save the updated account
            accountRepository.save(accountToUpdate);
        }
    }

    public void deleteAccount(String accountNumber) {
        accountRepository.deleteById(accountNumber);
    }
}
