/*part of 'extensions.dart';

extension ListX<E> on List<E> {
  List<E> sortedBy(Comparable key(E e)) {
    var tmpList = this;
    tmpList.sort((a, b) => key(a).compareTo(key(b)));
    return tmpList;
  }
}
*/