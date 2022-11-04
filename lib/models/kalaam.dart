class KalamCatalog {
  static List<Kalaam> kalaams = [

  ];
}

class Kalaam {
  final String type;
  final String subject;
  final String poet;
  final List<String> lines;

  Kalaam(
      {required this.type,
      required this.subject,
      required this.poet,
      required this.lines});

  factory Kalaam.fromJson(Map<String, dynamic> json) {
    return Kalaam(
      type: json['type'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}

/*{
  'key': 'value',
  'type': '_____',
  'subject': '______',
  'poet': '______',
  'lines': '[
    'value1',
    'value1',
  ]',
}*/
