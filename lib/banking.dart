// ignore_for_file: public_member_api_docs, sort_constructors_first
class Account {
  final String accNo;
  final String accountName;
  double balance;

  Account({
    required this.accNo,
    required this.accountName,
    this.balance = 0,
  });

  void updateBalance(double b) {
    balance = b;
  }

  @override
  bool operator ==(covariant Account other) {
    return other.accNo == accNo;
  }

  @override
  int get hashCode => accNo.hashCode;
}

class BankingSystem {
  int nextAccountNumber = 0;
  List<Account> accounts = [];

  List<Account> getAccounts() {
    return accounts;
  }

  void createAccount(String accountName) {
    accounts.add(Account(
      accNo: "$nextAccountNumber",
      accountName: accountName,
    ));

    nextAccountNumber++;
  }

  void deposit(String accNo, double amount) {
    final i = accounts.indexWhere((e) => e.accNo == accNo);
    accounts[i].updateBalance(accounts[i].balance + amount);
  }

  void withdraw(String accNo, double amount) {
    final i = accounts.indexWhere((e) => e.accNo == accNo);
    final newBalance = accounts[i].balance - amount;
    if (newBalance < 0) {
      throw Exception("Insufficient Funds to Withdraw");
    }
    accounts[i].updateBalance(newBalance);
  }
}
