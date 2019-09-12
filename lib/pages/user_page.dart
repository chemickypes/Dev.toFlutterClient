import 'package:cached_network_image/cached_network_image.dart';
import 'package:devtoclient/blocs/bloc_module.dart';
import 'package:devtoclient/blocs/user_bloc/bloc.dart';
import 'package:devtoclient/widgets/user_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  UserPage({Key key}) : super(key: key);

  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  UserBloc _userBloc = BlocsModule().get<UserBloc>();

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: BlocProvider<UserBloc>(
        builder: (context) => _userBloc,
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.all(16),
              child: _getScreen(state),
            );
          },
        ),
      ),
    );
  }

  Widget _getScreen(UserState state) {
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: "http://via.placeholder.com/200x150",
          imageBuilder: (context, imgProvider) => Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imgProvider,
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "NAME",
                  style: TextStyle(fontSize: 25),
                )
              ],
            ),
          ),
        )
      ],
    );
    return _notLoggedScreen();
  }

  Widget _notLoggedScreen() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          WelcomeTextWidget(),
          SizedBox(
            height: 30,
          ),
          Text('Insert your api-key in order to login'),
          TextField(
            decoration: InputDecoration(
              labelText: "Enter you api-key",
            ),
            controller: _controller,
          ),
          MaterialButton(
            child: Text('Login'),
            color: Colors.indigo,
            textColor: Colors.white,
            onPressed: () {
              _userBloc.saveApiKey(_controller.text);
            },
          )
        ],
      ),
    );
  }
}
