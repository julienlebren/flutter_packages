part of '../../sign_in.dart';

abstract class BaseUserRepository<T> {
  BaseUserRepository();

  Stream<T?> streamUser() {
    return const Stream.empty();
  }
}
