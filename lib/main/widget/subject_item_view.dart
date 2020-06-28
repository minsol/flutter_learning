import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/model/subject_model.dart';
import 'package:flutter_learning/util/size_fit.dart';

class SubjectViewItem extends StatelessWidget {
  final SubjectList subject;
  SubjectViewItem(this.subject);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1, color: Color(0xffe2e2e2)))
      ),
      child: Column(//列
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getUserInfoContentWidget(),
          getSubjectContentWidget()
        ],
      ),
    );
  }
  //
  Widget getUserInfoContentWidget() {
    return Container(
      height: 44,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 44,
            height: 44,
            child: ClipRRect(
            borderRadius: BorderRadius.circular(22),
            child: Image.network(
              subject.coverPath,
              width: SizeFit.screenWidth,
              fit: BoxFit.fill,//填充模式
            )
            ),
          ),
          Container(
            padding: EdgeInsets.only(left:10.0),
            child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    subject.nick,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    subject.date,
                    style: TextStyle(fontSize: 12, color: Colors.black),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
          ),
        ],
      ),
    );
  }

  //
  Widget getSubjectContentWidget() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          getContentDesc(),
          SizedBox(height: 3,),
          getContentImage(),
        ],
      ),
    );
  }

  Widget getContentImage() {
    return Container(
      width: SizeFit.screenWidth,
      height: subject.coverPath.isEmpty == true ? 0 : SizeFit.screenWidth * 9 / 16.0,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            subject.coverPath,
            width: SizeFit.screenWidth,
            fit: BoxFit.fill,//填充模式
          )
      ),
    );
  }


  Widget getContentDesc() {
    return Container(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              subject.title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 6,),
            Text(
              subject.contents,
              style: TextStyle(fontSize: 12, color: Colors.black),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 3,),
            SizedBox(height: 3,),
          ],
        ),
      ),
    );
  }


}