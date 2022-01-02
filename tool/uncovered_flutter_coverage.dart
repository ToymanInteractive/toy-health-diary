// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;

void main() {
  final lcovReportFile = File('coverage/lcov.info');
  if (!lcovReportFile.existsSync()) {
    print('Coverage lcov report does not exist.');

    return;
  }

  final uncoveredFiles = _getUncoveredFiles(lcovReportFile.readAsStringSync())
    ..remove('lib/generated_plugin_registrant.dart');

  File('test/fake_test.dart')
      .writeAsStringSync(_fakeTest(uncoveredFiles), mode: FileMode.writeOnly);
}

Set<String> _getUncoveredFiles(String lcovContent) {
  final sourceFiles =
      _findSourceFiles(Directory('lib'), false).map((f) => f.path).toSet();

  return sourceFiles
      .difference(_coveredFiles(lcovContent, Directory.current.path));
}

String _fakeTest(Iterable<String> uncoveredFiles) {
  final buffer = StringBuffer()
    ..writeln("import 'package:flutter_test/flutter_test.dart';")
    ..writeln();

  for (final file in uncoveredFiles) {
    buffer.writeln("import '../$file';");
  }

  buffer
    ..writeln()
    ..writeln('void main() {')
    ..writeln("  test('stub', () {});")
    ..writeln('}');

  return buffer.toString();
}

Iterable<File> _findSourceFiles(Directory directory, bool skipGenerated) {
  final sourceFiles = <File>[];
  for (final fileOrDir in directory.listSync()) {
    if (fileOrDir is File &&
        _isSourceFileHaveValidExtension(fileOrDir) &&
        _isSourceFileNotPartOfLibrary(fileOrDir)) {
      sourceFiles.add(fileOrDir);
    } else if (fileOrDir is Directory &&
        p.basename(fileOrDir.path) != 'packages') {
      sourceFiles.addAll(_findSourceFiles(fileOrDir, skipGenerated));
    }
  }

  return sourceFiles;
}

bool _isSourceFileHaveValidExtension(File file) =>
    p.extension(file.path).endsWith('.dart');

bool _isSourceFileNotPartOfLibrary(File file) =>
    file.readAsLinesSync().every((line) => !line.startsWith('part of '));

Set<String> _coveredFiles(String lcovContent, String packageRoot) {
  const lcovSourceFileToken = 'SF:';

  return LineSplitter.split(lcovContent)
      .where((line) => line.startsWith(lcovSourceFileToken))
      .map((line) => line.substring(lcovSourceFileToken.length).trim())
      .map((fileName) => p.relative(fileName, from: packageRoot))
      .toSet();
}
