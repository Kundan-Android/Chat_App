import 'package:flutter/material.dart';
import 'package:flutter_chat_app/ChatMessage.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<ChatMessage> _message = <ChatMessage> [];
  final TextEditingController _texController = new TextEditingController();
  void _handleSubmitted(String text){
    ChatMessage message = new ChatMessage(
      text: text,
    );
    _texController.clear();
    setState(() {
      _message.insert(0, message);
    });
  }

  Widget _textComposerWidget(){
    return new IconTheme(
      data: new IconThemeData(color: Colors.blue),
      child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: new Row(
            children: <Widget>[
              new Flexible(
                  child: new TextField(
                    decoration: new InputDecoration.collapsed(
                        hintText: 'Send a message'),
                    controller: _texController,
                    onSubmitted: _handleSubmitted,
                  ),
              ),
              new Container(
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                child: new IconButton(icon: new Icon(Icons.send),
                    onPressed: ()=> _handleSubmitted(_texController.text),
                    ),
              )
            ],
          )
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) =>_message[index] ,
              itemCount: _message.length,
            )
        ),
        new Divider(height: 1.0,),
        new Container(
          decoration: new BoxDecoration(
            color: Theme.of(context).cardColor,
          ),
          child: _textComposerWidget(),
        )
      ],
    );
  }
}
