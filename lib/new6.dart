void main() {
  bool isRaining = false;
  bool hasUmbrella = true;
  bool canGoOut = isRaining || hasUmbrella;
  print("可以出门吗？：$canGoOut");
}