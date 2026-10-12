class BankAccount {
    // TODO
  String Account_Holder;
  int Account_ID;
  double amount;

  BankAccount({
    required String this.Account_Holder,
    required int this.Account_ID,
    double this.amount = 0 
  });

  double get balance{
    return amount;
  }

  void withdraw (double amount){
    if(amount > this.amount){
      throw Exception("Insufficient Amount. Withdraw need to be less then the amount currently in the bank.");
    }
    this.amount -= amount;
    print("Sucessfully withdraw");
  }

  void credit(double amount){
    this.amount += amount;
  }
}

class Bank {
    // TODO
  String name;
  Set<int> Account= {};

  Bank({required String this.name});

  BankAccount createAccount(int accountId, String accountOwner){
    BankAccount newAccount = BankAccount(Account_Holder: accountOwner, Account_ID: accountId);

    for(int num in Account){
      if(newAccount.Account_ID == num){
        throw Exception("The account_ID is need to be unique");
      }
    }
    Account.add(accountId);

    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
