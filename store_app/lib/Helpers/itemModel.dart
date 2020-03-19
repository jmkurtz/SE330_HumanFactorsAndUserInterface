class Item {
  int id;
  final String itemName;
  final double unitPrice;
  final int quantity;
  final String description;
  final String genre;
  final bool isUsed;
  final bool isVerified;
  final String imagePath;

  Item({this.id, this.itemName, this.description, this.genre, this.isUsed, this.isVerified, this.unitPrice, this.quantity, this.imagePath});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'itemName': itemName,
      'unitPrice': unitPrice,
      'quantity': quantity,
      'description': description,
      'genre': genre,
      'isUsed': isUsed,
      'isVerified': isVerified,
      'imagePath': imagePath,
    };
  }

}