part of '../../sign_in.dart';

class UserRepository<T> {
  UserRepository(this.userId);

  final String userId;

  Stream<T?> streamUser() {
    return const Stream.empty();
  }
}
