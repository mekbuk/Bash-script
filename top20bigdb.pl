#!/usr/bin/perl
use File::Basename;

@dbs = </var/lib/mysql/*_*>;

%databases = ();

foreach $dbPath (@dbs) {
        $db = basename($dbPath);
        chomp($size = `du -s $dbPath`);
        $databases{$db} = $size;
}

@sorted = sort { $databases{$b} <=> $databases{$a} } (keys(%databases));

$format = "%-30s %-5s M\n";
print "\nTOP 20 BIGGEST MYSQL DATABASES\n\n";
foreach $key (@sorted[0..19]) {
        $size = int $databases{$key} / 1024;
        printf $format, $key, $size;
}
