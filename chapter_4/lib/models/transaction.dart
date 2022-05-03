class Transaction {
  String? id;
  String title;
  double amount;
  DateTime date;
  DateTime createDate;

  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date,
      required this.createDate});
}
