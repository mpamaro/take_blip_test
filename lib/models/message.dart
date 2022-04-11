class Message {
  final int id;
  final String content;
  final DateTime createdDate;
  final String from;
  final String to;
  final String status;

  Message({
    required this.id,
    required this.content,
    required this.createdDate,
    required this.from,
    required this.to,
    required this.status,
  });

  Message.fromJson(Map<String, dynamic> json)
      : id = int.parse(json['id']),
        content = json['content'],
        createdDate = DateTime.parse(json['createdDate']),
        from = json['from'],
        to = json['to'],
        status = json['status'];
}
