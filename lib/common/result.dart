// Rust stili Result
// Örnek: https://doc.rust-lang.org/rust-by-example/std/result.html

sealed class Result<V, E> {
  const Result();

  bool get isOk;
  bool get isErr;

  V? ok();
  E? err();

  V unwrap();
  E unwrapErr();

  T when<T>({
    required T Function(V value) ok,
    required T Function(E error) err,
  });
}

final class Ok<V, E> extends Result<V, E> {
  final V v;

  const Ok(this.v);

  @override
  bool get isOk => true;

  @override
  bool get isErr => false;

  @override
  V? ok() => v;

  @override
  E? err() => null;

  @override
  V unwrap() {
    return v;
  }

  @override
  E unwrapErr() {
    throw Exception("Ok: ${v.toString()}");
  }

  @override
  T when<T>({
    required T Function(V value) ok,
    required T Function(E error) err,
  }) {
    return ok(v);
  }

  @override
  bool operator ==(Object? other) => other is Ok<V, E> && other.v == v;

  @override
  int get hashCode {
    return Object.hash('Ok', v);
  }

  @override
  String toString() {
    return 'Ok($v)';
  }
}

final class Err<V, E> extends Result<V, E> {
  final E e;

  const Err(this.e);

  @override
  bool get isOk => false;

  @override
  bool get isErr => true;

  @override
  V? ok() => null;

  @override
  E? err() => e;

  @override
  V unwrap() {
    throw Exception("Err: ${e.toString()}");
  }

  @override
  E unwrapErr() {
    return e;
  }

  @override
  T when<T>({
    required T Function(V value) ok,
    required T Function(E error) err,
  }) {
    return err(e);
  }

  @override
  bool operator ==(Object? other) => other is Err<V, E> && other.e == e;

  @override
  int get hashCode {
    return Object.hash('Err', e);
  }

  @override
  String toString() {
    return 'Err($e)';
  }
}
