class Namaaz {
  final String topic;
  final String sawal;
  final String jawab;
  final String hawala;

  Namaaz({
    required this.sawal,
    required this.jawab,
    required this.hawala,
    required this.topic,
  });

  factory Namaaz.fromJson(Map<String, dynamic> json) {
    return Namaaz(
        sawal: json['sawal'],
        jawab: json['jawab'],
        hawala: json['hawala'],
        topic: json['topic']);
  }
}
