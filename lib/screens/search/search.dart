import 'package:e_shopping/generated/l10n.dart';
import 'package:e_shopping/providers/search_provider.dart';
import 'package:e_shopping/screens/navigation/search/search_list.dart';
import 'package:e_shopping/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  @override _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorLight,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextFormField(
        onTap: () => Utils.pushScreen(
          context: context,
          screen: SearchList(),
        ),
        readOnly: true,
        /*onChanged: (String currentText) {
          context.read<SearchNotifier>().changeString(search: currentText);
        },*/
        textAlignVertical: TextAlignVertical.center,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          border: InputBorder.none,
          isDense: true,
          contentPadding: kIsWeb ? EdgeInsets.only(top: 10) : EdgeInsets.zero,
          prefixIconConstraints: BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          prefixIcon: Icon(
            Icons.search,
          ),
          hintText: S.current.productSearchHint,
          suffixIconConstraints: BoxConstraints(
            minHeight: 36,
            minWidth: 36,
          ),
          /*suffixIcon: IconButton(
            constraints: BoxConstraints(
              minHeight: 36,
              minWidth: 36,
            ),
            splashRadius: 24,
            icon: Icon(
              Icons.clear,
            ),
            *//*onPressed: () {
              _textEditingController!.clear();
              context.read<SearchNotifier>().changeString(
                search: '',
              );
              FocusScope.of(context).requestFocus(FocusNode());
            },*//*
          ),*/
        ),
      ),
    );
  }
}