class Customer {
  int? customerId;
  String name;
  String mobile;
  String email;

  Customer({ 
    this.customerId,
    required this.name,
    required this.email,
    required this.mobile 
  });

  get customerName => null;
}