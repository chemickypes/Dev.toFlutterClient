import 'package:auto_size_text/auto_size_text.dart';
import 'package:devtoclient/blocs/user_bloc/bloc.dart';
import 'package:devtoclient/blocs/user_bloc/user_bloc.dart';
import 'package:devtoclient/models/articles.dart';
import 'package:devtoclient/pages/user_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarUserIcon extends StatelessWidget {
  const AppBarUserIcon({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, status) {

      return IconButton(
        icon: _getUserIcon(status),
        onPressed: () {
          //_bloc.saveApiKey("T5rmFtnJ2SMhjkhpHPRMGY3A");
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => UserPage(),
            ),
          );
        },
      );
    });
  }

  Widget _getUserIcon(UserState state) {
    return UserIcon(
      user: (state is UserLoadedState) ? state.user : null,
      height: 33,
      width: 33,
    );
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon({Key key, this.user, this.height = 33, this.width = 33})
      : super(key: key);
  final User user;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return _getUserIconStack();
  }

  Widget _getUserIconStack() {
    var ss = Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.center,
          child: Container(
            height: this.height,
            width: this.width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
          ),
        ),
        Align(
          alignment: Alignment.center,
          child: Icon(
            Icons.person,
            color: Colors.indigo,
          ),
        )
      ],
    );

    if (user != null) {
      if (user.profileImage90 != null) {
        ss.children.add(
          Align(
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.network(
                user.profileImage90,
                fit: BoxFit.cover,
                height: this.height - 3,
                width: this.width - 3,
              ),
            ),
          ),
        );
      } else {
        ss.children.add(
          Align(
            alignment: Alignment.center,
            child: Text(
              user.name[0],
              style:
                  TextStyle(color: Colors.indigo, fontWeight: FontWeight.bold),
            ),
          ),
        );
      }
    }
    return ss;
  }
}

class WelcomeTextWidget extends StatelessWidget {
  const WelcomeTextWidget({Key key, this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width -16,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Hi,',
            style: TextStyle(fontSize: 62,letterSpacing: 1),
          ),
          AutoSizeText(
            name ?? 'Dev.',
            style: TextStyle(fontSize: 72, color: Colors.indigo),
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}
