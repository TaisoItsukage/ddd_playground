//参考
//https://github.com/kaboc/flutter_ddd/blob/state_notifier/
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
      case RemovalException:
        return code == ExceptionCode.category
            ? 'Cannot be removed;\nthis category contains notes.'
            : 'Cannot be removed';
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

class NotUniqueException extends GenericException {
  NotUniqueException({required super.code, required String value})
      : assert(value.isNotEmpty),
        super(info: value);
}

class NullEmptyException extends GenericException {}

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
}
