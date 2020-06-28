import 'package:json_annotation/json_annotation.dart';

part 'subject_model.g.dart';


@JsonSerializable()
class SubjectModel extends Object {

  @JsonKey(name: 'list')
  List<SubjectList> subjectList;

  @JsonKey(name: 'paging')
  Paging paging;

  SubjectModel(this.subjectList,this.paging,);

  factory SubjectModel.fromJson(Map<String, dynamic> srcJson) => _$SubjectModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubjectModelToJson(this);

}


@JsonSerializable()
class SubjectList extends Object {

  @JsonKey(name: 'dsid')
  String dsid;

  @JsonKey(name: 'dcid')
  String dcid;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'date')
  String date;

  @JsonKey(name: 'o_uid')
  String oUid;

  @JsonKey(name: 'nick')
  String nick;

  @JsonKey(name: 'user_path')
  String userPath;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'contents')
  String contents;

  @JsonKey(name: 'circle_name')
  String circleName;

  @JsonKey(name: 'path')
  List<Path> path;

  @JsonKey(name: 'cover_path')
  String coverPath;

  SubjectList(this.dsid,this.dcid,this.status,this.date,this.oUid,this.nick,this.userPath,this.title,this.contents,this.circleName,this.path,this.coverPath,);

  factory SubjectList.fromJson(Map<String, dynamic> srcJson) => _$SubjectListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubjectListToJson(this);

}


@JsonSerializable()
class Path extends Object {

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'fid')
  String fid;

  Path(this.path,this.fid,);

  factory Path.fromJson(Map<String, dynamic> srcJson) => _$PathFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PathToJson(this);

}


@JsonSerializable()
class Paging extends Object {

  @JsonKey(name: 'total')
  String total;

  @JsonKey(name: 'page')
  int page;

  @JsonKey(name: 'per')
  int per;

  @JsonKey(name: 'cur')
  int cur;

  Paging(this.total,this.page,this.per,this.cur,);

  factory Paging.fromJson(Map<String, dynamic> srcJson) => _$PagingFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PagingToJson(this);

}


