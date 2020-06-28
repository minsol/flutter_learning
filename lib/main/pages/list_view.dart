
import 'package:flutter/cupertino.dart';
import 'package:flutter_learning/http/base/http_manager.dart';
import 'package:flutter_learning/model/subject_model.dart';
import 'package:flutter_learning/util/log_util.dart';
import 'package:flutter_learning/util/size_fit.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../widget/subject_item_view.dart';
import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<ListViewWidget> {
  int _page = 0;
  List<SubjectList> _subjectList = [];
  @override
  void initState() {
    super.initState();
    _onRefresh();
  }


  RefreshController _refreshController = RefreshController(initialRefresh: false);

  void _onRefresh() async{
    _page = 1;
    _loadData();
  }

  void _onLoading() async{
    _page++;
    _loadData();
  }

  void _loadData() async{
    var url ='http://test-api.mvmtv.cn/index.php?m=movlib&c=movie&a=summary&edition=3&mid=0029dc8c-ccc1-ba4b-f526-63a4b4183539&port=1&token=51c2dfe79a78b703d54a8c5c8c4ac070&uid=9509a2f5-fefc-6795-1fef-f40f65c8f697&version=2.18.0';
    var params = <String, String>{
      "dcid":"",
      "device":"1",
      "edition":"1",
      "o_uid":"",
      "page":_page.toString(),
      "size":"20",
      "token":"875d81288572e2efbc1c4a6fd0800b01",
      "type":"0",
      "uid":"397",
      "version":"2.0.2",
    };
    var url2 ='http://alpha-api2.91daxiang.cn/index.php?m=community&c=community&a=subjectList';
    HttpManager().getAsync(url:url2,params:params, tag: null).then((value){
      var model = SubjectModel.fromJson(value);
      LogUtil.v(model.subjectList);
      LogUtil.v(model);
      if(mounted)
        setState(() {
          if (_page == 1){
            _subjectList.removeRange(0, _subjectList.length);
          }
          _subjectList.addAll(model.subjectList);
        });
    }).catchError((error) {
      LogUtil.e(error);
    }).whenComplete((){
      _refreshController.refreshCompleted();
      _refreshController.loadComplete();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("发现"),
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: ClassicHeader(),
        footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
            Widget body ;
            if(mode==LoadStatus.idle){
              body =  Text("上拉加载");
            }
            else if(mode==LoadStatus.loading){
              body =  CupertinoActivityIndicator();
            }
            else if(mode == LoadStatus.failed){
              body = Text("加载失败！点击重试！");
            }
            else if(mode == LoadStatus.canLoading){
              body = Text("松手,加载更多!");
            }
            else{
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child:body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: CustomScrollView(
          slivers: <Widget>[
            // 如果不是Sliver家族的Widget，需要使用SliverToBoxAdapter做层包裹
            SliverToBoxAdapter(
              child: Container(
                height: 210,
                child: Swiper(
                  itemCount: 3,
                  autoplay: true,
                  pagination:  SwiperPagination(
                    alignment:Alignment.bottomRight,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {

                      },
                      child: Image.network(
                        "http://img-1301722230.cos.ap-guangzhou.myqcloud.com/2020/06/05F00F0A3-4612-4766-B366-AA665AED81AB.webp",
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ),
            // 当列表项高度固定时，使用 SliverFixedExtendList 比 SliverList 具有更高的性能
            SliverList(
                delegate: SliverChildBuilderDelegate(buildItem, childCount: _subjectList.length),
            )
          ],
        ),
      ),
      );
  }

  //ListView的Item
  Widget buildItem(BuildContext context, int index){
    return new GestureDetector(
      onTap: () {

      },
      child: new Container(
        child: SubjectViewItem(_subjectList[index]),
      ),
    );
  }
}
