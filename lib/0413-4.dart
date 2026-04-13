// 偶数提示函数
void printEvenMessage(int num) {
  print('$num是偶数');
}

// 奇数提示函数
void printOddMessage(int num) {
  print('$num是奇数');
}

// 执行传入函数的通用函数
void runCheck(Function func, int num) {
  func(num);
}

void main() {
  // 验证数字7（奇数）
  int num1 = 7;
  // 定义函数变量，根据奇偶性赋值对应函数
  Function func1 = num1 % 2 == 0 ? printEvenMessage : printOddMessage;
  runCheck(func1, num1);

  // 验证数字10（偶数）
  int num2 = 10;
  Function func2 = num2 % 2 == 0 ? printEvenMessage : printOddMessage;
  runCheck(func2, num2);
}