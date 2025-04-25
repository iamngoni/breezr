//
//  breezr_flutter
//  environment
//
//  Created by Ngonidzashe Mangudya on 25/04/2025.
//  Copyright (c) 2025 Codecraft Solutions.
//

enum Environment {
  development(name: 'Development', shortName: 'dev'),
  staging(name: 'Staging', shortName: 'staging'),
  production(name: 'Production', shortName: 'prod');

  const Environment({required this.name, required this.shortName});

  final String name;
  final String shortName;

  @override
  String toString() => name;
}
