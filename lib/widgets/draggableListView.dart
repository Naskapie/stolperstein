import 'package:flutter/material.dart';

class DraggableSearchableListView extends StatefulWidget {
  const DraggableSearchableListView({Key key, this.text}) : super(key: key);

  final String text;

  @override
  _DraggableSearchableListViewState createState() =>
      _DraggableSearchableListViewState();
}

class _DraggableSearchableListViewState
    extends State<DraggableSearchableListView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.20,
      minChildSize: 0.15,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0),
              topRight: Radius.circular(10.0),
            ),
          ),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 25 + 1,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 0.0,
                            left: 24.0,
                            right: 24.0,
                          ),
                          child: Text(
                            'Looking for results...',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      // Divider(color: Colors.grey),
                    ],
                  ),
                );
              }
              return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListTile(title: Text('Zeile $index:')));
            },
          ),
        );
      },
    );
  }
}
