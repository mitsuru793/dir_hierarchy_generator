# DirHierarchyGenerator

`Hash`, `Array`でディレクトリ階層を定義して作成することができます。コマンドではYAMLを読み込むことができます。1つのYAMLファイルでディレクトリ階層のfixtureを作ることができます。

ファイル、ディレクトリだけでなく、指定した内容を持つファイルも定義できます。

## Usage

### create

`file`オプションは必須です。`path`オプションを指定しない場合は、カレントディレクトリに作成されます。

```
# file_and_dir.ymlを元にディレクトリ階層を、tmpディレクトリに作成する。
dir_hierarchy_generator create -f file_and_dir.yml -p tmp
```

## Install

```
git clone https://github.com/mitsuru793/dir_hierarchy_generator
cd dir_hierarchy_generator
bundle install
bundle exec rake build
gem install pkg/dir_hierarchy_generator-0.1.0.gem
```

## Examples of Hash and YAML

| 作成物             | フォーマット             |
|:-------------------|:-------------------------|
| ディレクトリ       | 値が`Array`である`Hash`  |
| 空のファイル       | `Symbol`, `String`       |
| 内容のあるファイル | 値が`String`である`Hash` |

### ファイルだけ作成

```
[
  :file1,
  { file2: "content2" }
]
```

```yaml
- file1
- file2: 'content2'
```

### ディレクトリ階層を作成

```ruby
{
    dir1: [
    :file1,
    :file2
  ],
  dir2: [
    :file3,
    {
    dir3: [
     { file4: "content4" }
    ]
    },
    { dir4: [] }
  ]
}
```

```yaml
dir1:
  - file1
  - file2
dir2:
  - file3
  - dir3:
    - file4: 'content4'
  - dir4: []
```

### 空ディレクトリを作成

```ruby
{ dir1: [] }
``

空のディレクトリを生成する場合は、`Hash`に空の`Array`を持たせます。YAMLでは次の3通りの書き方があります。

```yaml
dir1: []
dir2:
  - null
dir3:
  - ~
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/dir_hierarchy_generator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

