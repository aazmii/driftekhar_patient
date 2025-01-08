// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Service {
  final String? title;
  final String? image;

  final String? todo;
  final String? description;
  Service({
    this.title,
    this.image,
    this.todo,
    this.description,
  });

  Service copyWith({
    String? title,
    String? image,
    String? todo,
    String? description,
  }) {
    return Service(
      title: title ?? this.title,
      image: image ?? this.image,
      todo: todo ?? this.todo,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'image': image,
      'todo': todo,
      'description': description,
    };
  }

  factory Service.fromMap(Map<String, dynamic> map) {
    return Service(
      title: map['title'] != null ? map['title'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      todo: map['todo'] != null ? map['todo'] as String : null,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Service.fromJson(String source) =>
      Service.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Service(title: $title, image: $image, todo: $todo, description: $description)';
  }

  @override
  bool operator ==(covariant Service other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.image == image &&
        other.todo == todo &&
        other.description == description;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        image.hashCode ^
        todo.hashCode ^
        description.hashCode;
  }
}
