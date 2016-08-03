# Some useful scripts for unix hackery

## Converting all UTF-16 files to ASCII

Windows is notorious for using UTF-16 and tricking git into thinking
that the file is binary. 
For example, when having SQL Server generate scripts for stored procedures
or table definitions, it generates them as UTF-16 and fools git.

You can see the difference by running the unix `file` command. EG:
```
$ file this-is-ASCII.txt
this-is-ASCII.txt: ASCII text, with CRLF line terminators
$ file this-file-out-to-be-ASCII-but-SQL-Server-made-it-binary.sql
this-file-out-to-be-ASCII-but-SQL-Server-made-it-binary.sql: Little-endian UTF-16 Unicode text, with CRLF, CR line terminators
```
`iconv` is a handy unix tool that easily deals with this. 
For example to fix the problem for all files that end in `.sql` creating ASCII versions that end in `.sql.txt` 
run the following command inside the directory containing all the `.sql` files
```
/path/to/scripts/utf16_2_ascii.sh
```

## Moving all files ending in one extension to another 

To iterate through all files in the current working directoy that and in `.sql.txt`
and move them to `.sql` (***thus overwriting any pre-existing files**) use the following
command inside the directory in question:

```
/path/to/scripts/mv_.sql.txt_2.sql.sh
```

## a nice .emacs config file

## a nice .screenrc config file
Makes screen work nicely with the `.emacs` above
