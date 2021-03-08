import 'package:json_annotation/json_annotation.dart';

part 'table_model.g.dart';

@JsonSerializable()
class TableType {
  final String name;
  final String slug;
  List<CafeTable> tables;

  TableType({this.name, this.slug, List<CafeTable> tables})
      : tables = tables ?? <CafeTable>[];

  factory TableType.fromJson(Map<String, dynamic> json) =>
      _$TableTypeFromJson(json);

  Map<String, dynamic> toJson() => _$TableTypeToJson(this);
}

@JsonSerializable()
class CafeTable {
  @JsonKey(name: 'table_name')
  final String name;
  final Customer customer;

  CafeTable({this.customer, this.name});

  factory CafeTable.fromJson(Map<String, dynamic> json) =>
      _$CafeTableFromJson(json);

  Map<String, dynamic> toJson() => _$CafeTableToJson(this);
}

@JsonSerializable()
class Customer {
  final int id;
  @JsonKey(name: 'date_created')
  final DateTime created;
  @JsonKey(name: 'date_modified')
  final DateTime modified;
  final String status;
  final String type;
  final int timestamp;
  final String token;

  Customer({
    this.id,
    this.created,
    this.modified,
    this.status,
    this.type,
    this.timestamp,
    this.token,
  });

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}
