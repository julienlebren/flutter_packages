part of extensions;

extension ListX<E> on List<E> {
  List<E> sortedBy(Comparable key(E e)) =>
      this..sort((a, b) => key(a).compareTo(key(b)));
}
