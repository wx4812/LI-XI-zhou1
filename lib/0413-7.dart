class Member {
  // 成员变量：姓名
  String name;

  // 构造函数：接收姓名，执行时输出提示
  Member(this.name) {
    print('会员对象已创建');
  }
}

void main() {
  // 使用"박지성"创建对象
  Member member = Member('박지성');
  // 输出姓名
  print('会员姓名：${member.name}');
}