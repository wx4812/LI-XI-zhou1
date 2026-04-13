class BankAccount {
  // 成员变量：账户持有人姓名（公开）
  String? owner;

  // 成员变量：账户余额（私有变量，_开头）
  int _balance = 0;

  // Getter：获取私有余额（符合题目要求）
  int get balance => _balance;

  // Setter：设置私有余额（符合题目要求）
  set balance(int value) => _balance = value;

  // 方法：存款
  void deposit(int money) {
    _balance += money;
    print('存入 $money 元，当前余额：$_balance 元');
  }

  // 方法：取款
  void withdraw(int money) {
    if (_balance >= money) {
      _balance -= money;
      print('取出 $money 元，当前余额：$_balance 元');
    } else {
      print('余额不足，无法取出 $money 元，当前余额：$_balance 元');
    }
  }
}

void main() {
  // 1. 创建账户
  BankAccount account = BankAccount();

  // 2. 设置账户持有人姓名
  account.owner = '홍길동'; // 可替换为任意姓名
  print('账户持有人：${account.owner}');

  // 3. 设置余额为 10000 元（通过setter设置）
  account.balance = 10000;
  print('初始余额设置为：${account.balance} 元');

  // 4. 存入 3000 元
  account.deposit(3000);

  // 5. 取出 5000 元
  account.withdraw(5000);

  // 6. 尝试取出 10000 元（余额不足，触发提示）
  account.withdraw(10000);
}