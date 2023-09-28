package com.staragile.banking.banking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/account")
public class MvcAccountController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/mvchello")
    public String doSomething() {
        return "Hello World!!!";
    }

    @GetMapping("/getAllAccounts")
    public String getAllAccounts(Model model) {
        List<Account> accountList = accountService.getAllAccounts();
        model.addAttribute("accountList", accountList);
        return "account"; // Return the view name (e.g., account.html)
    }

    @PostMapping("/createAccount")
    public String createAccount(@ModelAttribute Account account) {
        accountService.addAccount(account);
        return "redirect:/account/getAllAccounts";
    }

    @PostMapping("/updateAccount")
    public String updateAccount(@ModelAttribute Account account) {
        accountService.updateAccount(account.getAccountNumber(), account);
        return "redirect:/account/getAllAccounts";
    }

    @GetMapping("/deleteAccount/{accountNumber}")
    public String deleteAccount(@PathVariable String accountNumber) {
        accountService.deleteAccount(accountNumber);
        return "redirect:/account/getAllAccounts";
    }

    // New GET request for viewing an account by account number
    @GetMapping("/viewAccount/{accountNumber}")
    public String viewAccount(@PathVariable String accountNumber, Model model) {
        Optional<Account> optionalAccount = accountService.getAccountByAccountNumber(accountNumber);

        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            model.addAttribute("account", account);
            return "viewAccount"; // Return the view name (e.g., viewAccount.html)
        } else {
            // Handle the case where the account is not found
            return "accountNotFound"; // You can create a separate view for this scenario
        }
    }
}
