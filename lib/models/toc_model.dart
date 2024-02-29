import 'dart:convert';

TOC tocFromJson(String str) => TOC.fromJson(json.decode(str));

String tocToJson(TOC data) => json.encode(data.toJson());

class TOC {
  String id;
  String type;
  String num;
  String heading;
  String title;
  String component;
  String subcomponent;
  String url;
  List<String> children;

  TOC({
    required this.id,
    required this.type,
    required this.num,
    required this.heading,
    required this.title,
    required this.component,
    required this.subcomponent,
    required this.url,
    required this.children,
  });

  factory TOC.fromJson(Map<String, dynamic> json) => TOC(
    id: json["id"],
    type: json["type"],
    num: json["num"],
    heading: json["heading"],
    title: json["title"],
    component: json["component"],
    subcomponent: json["subcomponent"],
    url: json["url"],
    children: List<String>.from(json["children"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "num": num,
    "heading": heading,
    "title": title,
    "component": component,
    "subcomponent": subcomponent,
    "url": url,
    "children": List<dynamic>.from(children.map((x) => x)),
  };
}
