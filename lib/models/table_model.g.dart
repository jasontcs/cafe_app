// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'table_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TableType _$TableTypeFromJson(Map<String, dynamic> json) {
  return TableType(
    name: json['name'] as String,
    slug: json['slug'] as String,
    tables: (json['tables'] as List)
        ?.map((e) =>
            e == null ? null : CafeTable.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$TableTypeToJson(TableType instance) => <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'tables': instance.tables,
    };

CafeTable _$CafeTableFromJson(Map<String, dynamic> json) {
  return CafeTable(
    customer: json['customer'] == null
        ? null
        : Customer.fromJson(json['customer'] as Map<String, dynamic>),
    name: json['table_name'] as String,
  );
}

Map<String, dynamic> _$CafeTableToJson(CafeTable instance) => <String, dynamic>{
      'table_name': instance.name,
      'customer': instance.customer,
    };

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return Customer(
    id: json['id'] as int,
    created: json['date_created'] == null
        ? null
        : DateTime.parse(json['date_created'] as String),
    modified: json['date_modified'] == null
        ? null
        : DateTime.parse(json['date_modified'] as String),
    status: json['status'] as String,
    type: json['type'] as String,
    timestamp: json['timestamp'] as int,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'date_created': instance.created?.toIso8601String(),
      'date_modified': instance.modified?.toIso8601String(),
      'status': instance.status,
      'type': instance.type,
      'timestamp': instance.timestamp,
      'token': instance.token,
    };
