import 'package:tdd_dart/banking.dart';
import 'package:test/test.dart';

void main() {
  late BankingSystem system;

  setUp(() {
    system = BankingSystem();
  });

  test("System contains no accounts", () {
    expect(system.getAccounts().length, 0);
  });

  test("System Account counter starts with 0", () {
    expect(system.nextAccountNumber, 0);
  });

  test(
    "A new account can be created into the system with name",
    () {
      system.createAccount("Sushan");
      expect(system.accounts.last, Account(accNo: '0', accountName: "Sushan"));
      expect(system.nextAccountNumber, 1);

      system.createAccount("Shakya");
      expect(system.accounts.last, Account(accNo: '1', accountName: "Shakya"));
      expect(system.nextAccountNumber, 2);
    },
  );

  test(
    "Balance can be deposited onto a account",
    () {
      system.createAccount("Sushan");
      system.deposit("0", 100);
      expect(system.accounts.last.balance, 100);

      system.deposit("0", 100);
      expect(system.accounts.last.balance, 200);
    },
  );

  test("Withdrawing from an account with 0 balance throws Exception", () {
    system.createAccount("Sushan");
    expect(() => system.withdraw("0", 100), throwsException);
  });

  test(
    "Withdrawing from an account with insufficient balance throws Exception",
    () {
      system.createAccount("Sushan");
      system.deposit("0", 99);
      expect(() => system.withdraw("0", 100), throwsException);
    },
  );
  test(
    "Withdrawing from an account with sufficient balance should be success",
    () {
      system.createAccount("Sushan");
      system.deposit("0", 100);
      system.withdraw("0", 100);
      expect(system.accounts.last.balance, 0);
    },
  );
}
