class Pair<T1, T2> {
  T1 first;
  T2 second;

  Pair(this.first, this.second);
}

extension ExtensionListPair on List {
  Pair<dynamic, dynamic> toPair(){
    return Pair(this[0], this[1]);
  }
}