import 'package:experiments_with_web/app_level/commands/base_command.dart';
import 'package:experiments_with_web/app_level/constants/constants.dart';
import 'package:experiments_with_web/app_level/widgets/desktop/change_notifier.dart';
import 'package:experiments_with_web/search/string_search.dart';

class SearchCommand extends GenericNotifier with BaseCommand {
  SearchCommand() {
    _articles = _articleIDList;
  }

  List<String> showSearchResults(String searchTerm) {
    _searchedResults = StringSearch(_articles, searchTerm).relevantResults();
    notify();
    return _searchedResults;
  }

  List<String> get searchedResults => _searchedResults;

  // ************************** INTERNALS

  List<String> _articles;

  List<String> get _articleIDList {
    var articles = <String>[];

    OptionsModel.options().forEach((item) {
      articles.add(item.articleName);
    });

    return articles;
  }

  List<String> _searchedResults = [];
}
