import 'package:flutter/material.dart';

import 'package:basic_flutter_app/model/reply_model.dart';
import 'dart:math';

class ReplyCard extends StatefulWidget {
  final Reply reply;

  ReplyCard(this.reply);

  @override
  _ReplyCardState createState() => _ReplyCardState(reply);
}

class _ReplyCardState extends State<ReplyCard> {
  Reply reply;

  _ReplyCardState(this.reply);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.5),
      child: replyCard,
    );
  }

  /**
   * 沒辦法像 css align-slef 那樣把column最後一個<日期>獨立靠右 又不增加 <con>的寬度
   * */
  Widget get replyCard {
    return Container(
      color: const Color(0xFFF0E0D6),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(widget.reply.serial),
            ],
          ),
          replyContent,
          Align(
            widthFactor: 1,
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(widget.reply.id),
                Text('${new DateTime.now()}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget get replyContent {
    return Container(
//      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0.0, 0.0, 5.0, 5.0),
            child: Random().nextBool() ? dogImage : Text(''),
          ),
          Flexible(child: Text(widget.reply.content)),
        ],
      ),
    );
  }

  //////////////////////////////////////////////////////

  String renderUrl;

  Widget get dogImage {
    return Container(
      // You can explicitly set heights and widths on Containers.
      // Otherwise they take up as much space as their children.
      width: 80.0,
      height: 80.0,
      // Decoration is a property that lets you style the container.
      // It expects a BoxDecoration.
      decoration: BoxDecoration(
        // BoxDecorations have many possible properties.
        // Using BoxShape with a background image is the
        // easiest way to make a circle cropped avatar style image.
        shape: BoxShape.rectangle,
        image: DecorationImage(
          // Just like CSS's `imagesize` property.
          fit: BoxFit.cover,
          // A NetworkImage widget is a widget that
          // takes a URL to an image.
          // ImageProviders (such as NetworkImage) are ideal
          // when your image needs to be loaded or can change.
          // Use the null check to avoid an error.
          image: NetworkImage(renderUrl ?? ''),
        ),
      ),
    );
  }

  //////////////////////////////////////////////////////
// State classes run this method when the state is created.
// You shouldn't do async work in initState, so we'll defer it
// to another method.
  void initState() {
    super.initState();
    renderDogPic();
  }

  // IRL, we'd want the Dog class itself to get the image
// but this is a simpler way to explain Flutter basics
  void renderDogPic() async {
    // this makes the service call
    await reply.getImageUrl();
    // setState tells Flutter to rerender anything that's been changed.
    // setState cannot be async, so we use a variable that can be overwritten
    setState(() {
      renderUrl = reply.imageUrl;
    });
  }
}
