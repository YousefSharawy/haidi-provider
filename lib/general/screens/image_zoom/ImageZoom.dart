import 'package:base_flutter/general/utilities/tf_custom_widgets/widgets/MyText.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:tf_validator/localization/LocalizationMethods.dart';

import '../../MyApp.dart';


class ImageZoom extends StatefulWidget {
  final List images;
  final String? heroTag;
  final String? imgUrl;

  const ImageZoom({required this.images, this.heroTag, this.imgUrl});
  @override
  _ImageZoomState createState() => _ImageZoomState();
}

class _ImageZoomState extends State<ImageZoom> {

  var _current;
  final ValueNotifier _notifier=new ValueNotifier<int>(0);
  late PageController _controller ;


  @override
  void initState() {
    // _controller=new PageController(initialPage: 0);
    // _current= widget.images.first;
    _controller = new PageController(initialPage: 0);
    _current =widget.imgUrl != null ? 1: widget.images.first;
    super.initState();
  }

  _setChangeImage(index){
    _current=widget.images[index];
    _notifier.value=index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: MyText(title: tr(context,"gallery"),color: Colors.white, size: 10,) ,
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios,
              size: 25,
              color: Colors.white,
            ),
            onTap: () {
              navigationKey.currentState!.pop();
            },
          ),
        ),
        body: Container(
          child: PhotoViewGallery.builder(
              pageController: _controller,
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount:widget.imgUrl != null ? 1:widget.images.length,
              onPageChanged:widget.imgUrl != null ? null:_setChangeImage,
              scrollDirection: Axis.horizontal,
              builder: (context, index) => PhotoViewGalleryPageOptions(
                  imageProvider:widget.imgUrl != null ? NetworkImage(widget.imgUrl??''):NetworkImage(widget.images[index]),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 4,
                  heroAttributes: PhotoViewHeroAttributes(tag: widget.heroTag??'')
              )
          ),
        )
    );
  }
}

