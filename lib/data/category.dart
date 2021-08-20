class Category {
  final String title;
  final List<String>? selections;

  Category({required this.title, this.selections});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = {};
    _data['title'] = title;
    _data['selections'] = selections;
    return _data;
  }
}