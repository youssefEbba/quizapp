// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:quizz/pages/quizz.dart';
import 'package:quizz/provider/authe_pro.dart';

import 'package:quizz/provider/quizprovider.dart';
import 'package:quizz/utile/utill.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool loading = true;

  var ctime;
  void get(String cat) {
    final quizmodel = Provider.of<Quiz>(context, listen: false);
    quizmodel.getQuiz(cat);
    loading = false;
  }

  @override
  Widget build(BuildContext context) {
    final quizmodel = Provider.of<Quiz>(context);
    final user = Provider.of<AuthViewModel>(context);
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          title: const Text('Quiz de soutien Scolaire'),
          automaticallyImplyLeading: false,
        ),
        drawer: drawer(
            context,
            user.userModel == null ? '' : user.userModel?.name,
            user.userModel == null ? '' : user.userModel?.email),
        body: WillPopScope(
          onWillPop: () {
            DateTime now = DateTime.now();
            if (ctime == null || now.difference(ctime) > Duration(seconds: 2)) {
              //add duration of press gap
              ctime = now;
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Press Back Button Again to Exit'))); //scaffold message, you can show Toast message too.
              return Future.value(false);
            }

            return Future.value(true);
          },
          child: Container(
              color: Colors.blueGrey[100],
              padding: EdgeInsets.only(top: 120, left: 20, right: 20),
              child: loading
                  ? ListView.builder(
                      itemCount: 1,
                      itemBuilder: ((context, index) {
                        return ListTile(
                            hoverColor: Colors.blueAccent,
                            title: Column(
                              children: [
                                Text(
                                  'Choisisez un module ',
                                  style: TextStyle(fontSize: 20),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextButton(
                                    onPressed: () {
                                      get('devellopent');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue),
                                        width: 300,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Devloppement',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))),
                                TextButton(
                                    onPressed: () {
                                      get('Reseaux');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue),
                                        width: 300,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Reseaux',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))),
                                TextButton(
                                    onPressed: () {
                                      get('Sytemes d\'information');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue),
                                        width: 300,
                                        height: 50,
                                        child: Center(
                                          child: Text(
                                            'Sytemes d\'information',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ))),
                                TextButton(
                                    onPressed: () {
                                      get('Gestion des projets');
                                    },
                                    child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue),
                                        width: 300,
                                        height: 50,
                                        child: Center(
                                          child: Text('Gestion des projets',
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ))),
                              ],
                            ));
                      }))
                  : Column(
                      children: [
                        Text(
                          'Choisisez un quiz ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Expanded(
                          child: ListView.builder(
                              itemCount: quizmodel.quizzs.length,
                              itemBuilder: ((context, index) {
                                return ListTile(
                                    title: Column(
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) => Quizz(
                                                      quizmodel.quizzs[index]
                                                          ['titre'],
                                                      quizmodel.quizzs[index]
                                                          ['duree'])));
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blue),
                                          width: 300,
                                          height: 50,
                                          child: Center(
                                            child: Text(
                                              quizmodel.quizzs[index]['titre'],
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                  ],
                                ));
                              })),
                        ),
                        ElevatedButton.icon(
                            onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView())),
                            icon: Icon(Icons.reply),
                            label: Text('Annuler'))
                      ],
                    )),
        ));
  }
}
