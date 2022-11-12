//参考
//https://github.com/kaboc/flutter_ddd/blob/state_notifier/

//各ドメインオブジェクトでassertを設定すれば、この文章は不要な気もする。
//→catch onの指定をするときに詰む。
//以下の例で言うと、「NullEmptyExceptionだけをcatchする」ができなくなり、例外を握りつぶしてしまう恐れがある
//  try {
//   throw (NullEmptyException());
// } on NullEmptyException catch (e) {
//   print(e.message);
// }
class GenericException implements Exception {
  GenericException({this.code = ExceptionCode.unknown, this.info});
  final ExceptionCode code;
  final dynamic info;

  @override
  String toString() {
    return '$runtimeType: ${code.name}';
  }

  String get message {
    switch (runtimeType) {
      case NotFoundException:
        return '${code.name}: $info\nis not found.';
      case NotUniqueException:
        return '${code.name}: $info\nalready exists.';
      case NullEmptyException:
        return '${code.name}\nmust not be empty.';
      case LengthException:
        return '${code.name} must be $info letters or shorter.';
      default:
        return 'Unknown error occurred.';
    }
  }
}

class NotFoundException extends GenericException {
  NotFoundException({required super.code, required String target})
      : assert(target.isNotEmpty),
        super(info: target);
}

//意図が不明。
class NotUniqueException extends GenericException {
  NotUniqueException({required super.code, required String value})
      : assert(value.isNotEmpty),
        super(info: value);
}

class NullEmptyException extends GenericException {
  NullEmptyException({required super.code, required String value})
      : assert(value.isNotEmpty),
        super(info: value);
}

class LengthException extends GenericException {
  LengthException({super.code, required int max})
      : assert(max > 0),
        super(info: max);
}

class RemovalException extends GenericException {
  RemovalException({required super.code});
}

//ドメインオブジェクト1つにつき、enum値を1つ用意するのがよさそう
enum ExceptionCode {
  unknown,
  userId,
}
