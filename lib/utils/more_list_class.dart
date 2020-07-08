class MoreList {
  String _title;
  String _path;
  String _icon;

  MoreList(String title, String path, String icon) {
    this._title = title;
    this._path = path;
    this._icon = icon;
  }

  String getTitle() {
    return _title;
  }

  String getPath() {
    return _path;
  }

  String getIcon() {
    return _icon;
  }
}
