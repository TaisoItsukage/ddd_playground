import 'package:ddd_playground/util/exception/exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class Address extends Equatable {
  Address(this.address) {
    if (address.isEmpty) {
      throw NullEmptyException(code: ExceptionCode.address, value: address);
    }
  }
  final String address;

  @override
  List<Object?> get props => [address];
}
