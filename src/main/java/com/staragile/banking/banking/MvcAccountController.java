package com.staragile.banking.banking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.staragile.banking.banking.Account;
import com.staragile.banking.banking.AccountService;

import net.bytebuddy.dynamic.DynamicType.Builder.FieldDefinition.Optional;

@Controller
//@RequestMapping("/account")
public class MvcAccountController {

    @Autowired
    private AccountService accountService;

    @GetMapping("/mvchello")
    public String doSomething() {
    	System.out.println("hello world");
        return "hello.jsp";
    }
    @GetMapping("/mvchello1")
    public String doSomething1() {
    	System.out.println("hello world");
        return "hello";
    }
    @RequestMapping("/getAllAccounts")
    public String getAllAccounts(Model model) {
    	System.out.println("get all account");
        java.util.List<Account> accountList = accountService.getAllAccounts();
        model.addAttribute("accountList", accountList);
        return "banking"; // Assuming your JSP file is named "account.jsp"
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
        java.util.Optional<Account> optionalAccount = accountService.getAccountByAccountNumber(accountNumber);

        if (optionalAccount.isPresent()) {
            Account account = optionalAccount.get();
            model.addAttribute("account", account);
            return "viewAccount"; // Assuming your JSP file is named "viewAccount.jsp"
        } else {
            // Handle the case where the account is not found
            return "accountNotFound"; // You can create a separate view for this scenario
        }
    }
}
