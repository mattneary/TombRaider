# Tomb Raider

Tomb Raider is a command line tool that fulfills a very simple task: it
extracts resources from iOS backups. Below is an example of its usage.

```sh
$ backup="/Users/me/Library/Application Support/MobileSync/Backup/81a36241bb6080f626597dad0cf830e9710e7f39"
$ ruby extract.rb "$backup" "/Extract"
```

