import 'package:equatable/equatable.dart';

class CustomError extends Equatable {
  const CustomError({
    this.code = '',
    this.msg = '',
    this.plugin = '',
  });

  final String code;
  final String msg;
  final String plugin;

  @override
  List<Object> get props => [code, msg, plugin];

  @override
  String toString() => 'CustomError(code:$code,message:$msg,plugin:$plugin)';
}
