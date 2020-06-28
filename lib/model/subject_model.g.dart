// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubjectModel _$SubjectModelFromJson(Map<String, dynamic> json) {
  return SubjectModel(
    (json['list'] as List)
        ?.map((e) =>
            e == null ? null : SubjectList.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['paging'] == null
        ? null
        : Paging.fromJson(json['paging'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SubjectModelToJson(SubjectModel instance) =>
    <String, dynamic>{
      'list': instance.subjectList,
      'paging': instance.paging,
    };

SubjectList _$SubjectListFromJson(Map<String, dynamic> json) {
  return SubjectList(
    json['dsid'] as String,
    json['dcid'] as String,
    json['status'] as String,
    json['date'] as String,
    json['o_uid'] as String,
    json['nick'] as String,
    json['user_path'] as String,
    json['title'] as String,
    json['contents'] as String,
    json['circle_name'] as String,
    (json['path'] as List)
        ?.map(
            (e) => e == null ? null : Path.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['cover_path'] as String,
  );
}

Map<String, dynamic> _$SubjectListToJson(SubjectList instance) =>
    <String, dynamic>{
      'dsid': instance.dsid,
      'dcid': instance.dcid,
      'status': instance.status,
      'date': instance.date,
      'o_uid': instance.oUid,
      'nick': instance.nick,
      'user_path': instance.userPath,
      'title': instance.title,
      'contents': instance.contents,
      'circle_name': instance.circleName,
      'path': instance.path,
      'cover_path': instance.coverPath,
    };

Path _$PathFromJson(Map<String, dynamic> json) {
  return Path(
    json['path'] as String,
    json['fid'] as String,
  );
}

Map<String, dynamic> _$PathToJson(Path instance) => <String, dynamic>{
      'path': instance.path,
      'fid': instance.fid,
    };

Paging _$PagingFromJson(Map<String, dynamic> json) {
  return Paging(
    json['total'] as String,
    json['page'] as int,
    json['per'] as int,
    json['cur'] as int,
  );
}

Map<String, dynamic> _$PagingToJson(Paging instance) => <String, dynamic>{
      'total': instance.total,
      'page': instance.page,
      'per': instance.per,
      'cur': instance.cur,
    };
