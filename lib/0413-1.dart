void main() {
  var products = ['Laptop', 'Mouse', 'Keyboard'];
  products.forEach((item) {
    print('${products.indexOf(item) + 1}号商品：$item');
  });
}