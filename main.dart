//Define an abstract class Account
abstract class Account {
  // Declare the properties
  int accountNumber;
  double balance;

  // Define a constructor with initializing formal parameters
  Account(this.accountNumber, this.balance);

  // Define a method to deposit money
  void deposit(double amount) {
    balance += amount;
  }

  // Define an abstract method to withdraw money
  void withdraw(double amount);
}

// Define a class SavingsAccount that extends Account
class SavingsAccount extends Account {
  // Declare an additional property
  double interestRate;

  // Define a constructor that calls the super constructor
  SavingsAccount(int accountNumber, double balance, this.interestRate)
      : super(accountNumber, balance);

  // Override the withdraw method
  @override
  void withdraw(double amount) {
    // Subtract the amount from the balance
    balance -= amount;
    // Apply the interest rate to the remaining balance
    balance *= (1 + interestRate);
  }
}

// Define a class CurrentAccount that extends Account
class CurrentAccount extends Account {
  // Declare an additional property
  double overdraftLimit;

  // Define a constructor that calls the super constructor
  CurrentAccount(int accountNumber, double balance, this.overdraftLimit)
      : super(accountNumber, balance);

  // Override the withdraw method
  @override
  void withdraw(double amount) {
    // Check if the amount exceeds the overdraft limit
    if (amount > balance + overdraftLimit) {
      // Print a message indicating insufficient funds
      print('Insufficient funds');
    } else {
      // Subtract the amount from the balance
      balance -= amount;
    }
  }
}

// Define a main function to test the code
void main() {
  // Create an instance of SavingsAccount with some values
  var savings = SavingsAccount(123456, 1000.0, 0.01);
  // Use the instance to perform some operations
  savings.deposit(500.0); // Deposit 500.0
  savings.withdraw(200.0); // Withdraw 200.0 and apply interest rate
  print(savings.balance); // Print the current balance

  // Create an instance of CurrentAccount with some values
  var current = CurrentAccount(654321, 500.0, 100.0);
  // Use the instance to perform some operations
  current.deposit(300.0); // Deposit 300.0
  current.withdraw(700.0); // Withdraw 700.0 within the limit
  print(current.balance); // Print the current balance
  current.withdraw(200.0); // Withdraw 200.0 exceeding the limit
}