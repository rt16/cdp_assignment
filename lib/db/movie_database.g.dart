// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class MovieData extends DataClass implements Insertable<MovieData> {
  final int page;
  final List<dynamic>? results;
  final int total_pages;
  final int total_results;
  MovieData(
      {required this.page,
      this.results,
      required this.total_pages,
      required this.total_results});
  factory MovieData.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return MovieData(
      page: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}page'])!,
      results: $MovieTable.$converter0.mapToDart(const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}results'])),
      total_pages: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_pages'])!,
      total_results: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}total_results'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['page'] = Variable<int>(page);
    if (!nullToAbsent || results != null) {
      final converter = $MovieTable.$converter0;
      map['results'] = Variable<String?>(converter.mapToSql(results));
    }
    map['total_pages'] = Variable<int>(total_pages);
    map['total_results'] = Variable<int>(total_results);
    return map;
  }

  MovieCompanion toCompanion(bool nullToAbsent) {
    return MovieCompanion(
      page: Value(page),
      results: results == null && nullToAbsent
          ? const Value.absent()
          : Value(results),
      total_pages: Value(total_pages),
      total_results: Value(total_results),
    );
  }

  factory MovieData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return MovieData(
      page: serializer.fromJson<int>(json['page']),
      results: serializer.fromJson<List<dynamic>?>(json['results']),
      total_pages: serializer.fromJson<int>(json['total_pages']),
      total_results: serializer.fromJson<int>(json['total_results']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'page': serializer.toJson<int>(page),
      'results': serializer.toJson<List<dynamic>?>(results),
      'total_pages': serializer.toJson<int>(total_pages),
      'total_results': serializer.toJson<int>(total_results),
    };
  }

  MovieData copyWith(
          {int? page,
          List<dynamic>? results,
          int? total_pages,
          int? total_results}) =>
      MovieData(
        page: page ?? this.page,
        results: results ?? this.results,
        total_pages: total_pages ?? this.total_pages,
        total_results: total_results ?? this.total_results,
      );
  @override
  String toString() {
    return (StringBuffer('MovieData(')
          ..write('page: $page, ')
          ..write('results: $results, ')
          ..write('total_pages: $total_pages, ')
          ..write('total_results: $total_results')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(
      page.hashCode,
      $mrjc(results.hashCode,
          $mrjc(total_pages.hashCode, total_results.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieData &&
          other.page == this.page &&
          other.results == this.results &&
          other.total_pages == this.total_pages &&
          other.total_results == this.total_results);
}

class MovieCompanion extends UpdateCompanion<MovieData> {
  final Value<int> page;
  final Value<List<dynamic>?> results;
  // ignore: non_constant_identifier_names
  final Value<int> total_pages;
  // ignore: non_constant_identifier_names
  final Value<int> total_results;
  const MovieCompanion({
    this.page = const Value.absent(),
    this.results = const Value.absent(),
    this.total_pages = const Value.absent(),
    this.total_results = const Value.absent(),
  });
  MovieCompanion.insert({
    required int page,
    this.results = const Value.absent(),
    required int total_pages,
    required int total_results,
  })  : page = Value(page),
        total_pages = Value(total_pages),
        total_results = Value(total_results);
  static Insertable<MovieData> custom({
    Expression<int>? page,
    Expression<List<dynamic>?>? results,
    Expression<int>? total_pages,
    Expression<int>? total_results,
  }) {
    return RawValuesInsertable({
      if (page != null) 'page': page,
      if (results != null) 'results': results,
      if (total_pages != null) 'total_pages': total_pages,
      if (total_results != null) 'total_results': total_results,
    });
  }

  MovieCompanion copyWith(
      {Value<int>? page,
      Value<List<dynamic>?>? results,
      Value<int>? total_pages,
      Value<int>? total_results}) {
    return MovieCompanion(
      page: page ?? this.page,
      results: results ?? this.results,
      total_pages: total_pages ?? this.total_pages,
      total_results: total_results ?? this.total_results,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (page.present) {
      map['page'] = Variable<int>(page.value);
    }
    if (results.present) {
      final converter = $MovieTable.$converter0;
      map['results'] = Variable<String?>(converter.mapToSql(results.value));
    }
    if (total_pages.present) {
      map['total_pages'] = Variable<int>(total_pages.value);
    }
    if (total_results.present) {
      map['total_results'] = Variable<int>(total_results.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MovieCompanion(')
          ..write('page: $page, ')
          ..write('results: $results, ')
          ..write('total_pages: $total_pages, ')
          ..write('total_results: $total_results')
          ..write(')'))
        .toString();
  }
}

class $MovieTable extends Movie with TableInfo<$MovieTable, MovieData> {
  final GeneratedDatabase _db;
  final String? _alias;
  $MovieTable(this._db, [this._alias]);
  final VerificationMeta _pageMeta = const VerificationMeta('page');
  late final GeneratedColumn<int?> page = GeneratedColumn<int?>(
      'page', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _resultsMeta = const VerificationMeta('results');
  late final GeneratedColumnWithTypeConverter<List<dynamic>, String?> results =
      GeneratedColumn<String?>('results', aliasedName, true,
              typeName: 'TEXT', requiredDuringInsert: false)
          .withConverter<List<dynamic>>($MovieTable.$converter0);
  final VerificationMeta _total_pagesMeta =
      const VerificationMeta('total_pages');
  late final GeneratedColumn<int?> total_pages = GeneratedColumn<int?>(
      'total_pages', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  final VerificationMeta _total_resultsMeta =
      const VerificationMeta('total_results');
  late final GeneratedColumn<int?> total_results = GeneratedColumn<int?>(
      'total_results', aliasedName, false,
      typeName: 'INTEGER', requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [page, results, total_pages, total_results];
  @override
  String get aliasedName => _alias ?? 'movie';
  @override
  String get actualTableName => 'movie';
  @override
  VerificationContext validateIntegrity(Insertable<MovieData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('page')) {
      context.handle(
          _pageMeta, page.isAcceptableOrUnknown(data['page']!, _pageMeta));
    } else if (isInserting) {
      context.missing(_pageMeta);
    }
    context.handle(_resultsMeta, const VerificationResult.success());
    if (data.containsKey('total_pages')) {
      context.handle(
          _total_pagesMeta,
          total_pages.isAcceptableOrUnknown(
              data['total_pages']!, _total_pagesMeta));
    } else if (isInserting) {
      context.missing(_total_pagesMeta);
    }
    if (data.containsKey('total_results')) {
      context.handle(
          _total_resultsMeta,
          total_results.isAcceptableOrUnknown(
              data['total_results']!, _total_resultsMeta));
    } else if (isInserting) {
      context.missing(_total_resultsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => <GeneratedColumn>{};
  @override
  MovieData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return MovieData.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $MovieTable createAlias(String alias) {
    return $MovieTable(_db, alias);
  }

  static TypeConverter<List<dynamic>, String> $converter0 =
      const ResultConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $MovieTable movie = $MovieTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [movie];
}
