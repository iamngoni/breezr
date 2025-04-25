//
//  breezr_flutter
//  application_error
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

class ApplicationError implements Exception {
  ApplicationError(this.message, {this.title = "Hey, it's not your fault"});

  factory ApplicationError.unknownError() =>
      ApplicationError('An unknown error occurred');

  final String message;
  final String title;

  ApplicationError copyWith({String? message, String? title}) {
    return ApplicationError(
      message ?? this.message,
      title: title ?? this.title,
    );
  }
}
