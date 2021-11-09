abstract class HostRecord {
  String getAsString();
}

class SourceTargetHostRecord extends HostRecord {
  final String source;
  final String target;

  SourceTargetHostRecord({required this.source, this.target = '0.0.0.0'});

  String getAsString() {
    return '${this.source} ${this.target}';
  }
}

class CommentHostRecord extends HostRecord {
  final String contents;

  CommentHostRecord({required this.contents});

  @override
  String getAsString() {
    return contents;
  }
}
