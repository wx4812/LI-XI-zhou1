class Product {
  // 成员变量：商品名称
  String name;

  // 普通构造函数：接收商品名称
  Product(this.name);

  // 命名构造函数 Product.event()：默认名称为"活动商品"
  Product.event() : name = "活动商品";
}

void main() {
  // 1. 使用普通构造函数创建对象
  Product product1 = Product("笔记本电脑");
  print("普通商品名称：${product1.name}");

  // 2. 使用命名构造函数创建对象
  Product product2 = Product.event();
  print("活动商品名称：${product2.name}");
}