package com.staragile.banking.banking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/account") // Define a common base path for all endpoints
public class AccountController {

    @Autowired
    private AccountService accountService;

    @RequestMapping("/hello")
    public String doSomething() {
        return "Hello World!!!";
    }

    @RequestMapping("/seeddata")
    public String seedAccounts() {
        // Create and seed account data (you may modify this as needed)
        Account account1 = new Account("1001", "John Doe", "123 Main St", "555-1234");
        Account account2 = new Account("1002", "Jane Smith", "456 Elm St", "555-5678");

        accountService.addAccount(account1);
        accountService.addAccount(account2);

        return "Data seeded successfully!!!";
    }

    @GetMapping("/{accountNumber}")
    public Optional<Account> getAccountByAccountNumber(@PathVariable String accountNumber) {
        return accountService.getAccountByAccountNumber(accountNumber);
    }

    @GetMapping
    public List<Account> getAllAccounts() {
        return accountService.getAllAccounts();
    }

    @PostMapping("/createAccount")
    public String createAccount(@RequestBody Account account) {
    	System.out.println(account.getAccountNumber()+","+account.getContactNumber()+","+account.getCustomerAddress()+","+account.getCustomerName());
        accountService.addAccount(account);
       
        return "Account created successfully!";
    }

    @PutMapping("/updateAccount/{accountNumber}")
    public String updateAccount(@PathVariable String accountNumber, @RequestBody Account updatedAccount) {
        accountService.updateAccount(accountNumber, updatedAccount);
        return "Account updated successfully!";
    }

    @DeleteMapping("/deleteAccount/{accountNumber}")
    public String deleteAccount(@PathVariable String accountNumber) {
        accountService.deleteAccount(accountNumber);
        return "Account deleted successfully!";
    }

    // New GET request for viewing an account by account number
    @GetMapping("/viewAccount/{accountNumber}")
    public Optional<Account> viewAccount(@PathVariable String accountNumber) {
        return accountService.getAccountByAccountNumber(accountNumber);
    }
}
