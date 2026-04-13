class Student {
  // 成员变量：姓名、年级
  String name;
  int grade;

  // 构造函数
  Student(this.name, this.grade);

  // 自我介绍方法，按要求格式输出
  void introduce() {
    print('你好，我是 $name，是$grade年级学生。');
  }
}

void main() {
  // 1. 普通方式创建对象
  Student student1 = Student('김철수', 2);
  student1.introduce();

  // 2. 级联运算符（..）创建对象，链式调用
  Student student2 = Student('영희', 3)..introduce();

  // 3. 声明可空变量，使用空安全调用符 ?.
  Student? student3;
  student3?.introduce(); // 因student3为null，不会执行，无报错

  // 补充：给student3赋值后再调用
  student3 = Student('민수', 1);
  student3?.introduce();
}