import 'package:flutter/material.dart';

class SearchPageCustomDelegate extends SearchDelegate {
  String get searchFieldLabel => 'whate you want';
  final List<String> _result = [
    'result  1',
    'result 2',
    'result 3',
    'result 4',
    'result 5'
  ];

  final List<String> _suggestionList = [
    'suggestion 1',
    'suggestion 2',
    'suggestion 3',
    'suggestion 4',
    'suggestion 5',
    'suggestion 6'
  ];

  Widget _createListView(List<String> datas) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(left: 15, top: 5, right: 15, bottom: 5),
          child: Text(
            datas[index] ?? 'no match',
            textAlign: TextAlign.start,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
                decorationColor: Colors.blueGrey),
          ),
        );
      },
      separatorBuilder: (context,index) => Divider(
      height: 1,
      color: Colors.indigoAccent,
    ),
      scrollDirection: Axis.vertical,
      itemCount: datas.length ?? 1,
      shrinkWrap:true ,
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          tooltip: 'Clear',
          icon: const Icon(Icons.clear),
          onPressed: () {
            query = '';
            showSuggestions(context);
            print('click build action btn');
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      tooltip: 'back',
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
      onPressed: () {
        close(context, null);
        print('clicke leading button');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return _createListView(_result);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return ListView();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return theme.copyWith(
        inputDecorationTheme: InputDecorationTheme(),
        primaryColor: theme.primaryColor,
        primaryIconTheme: theme.primaryIconTheme,
        primaryColorBrightness: theme.primaryColorBrightness,
        primaryTextTheme: theme.primaryTextTheme);
  }
}
