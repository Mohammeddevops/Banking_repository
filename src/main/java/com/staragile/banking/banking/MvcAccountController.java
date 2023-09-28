package com.staragile.banking.banking;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/account") // Define a common base path for all endpoints
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
}
