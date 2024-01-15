#! /usr/bin/env bash
INDEX_META=site/index.md

rm -f $INDEX_META

HEADER=`cat <<EOF
---
title: M2AS
---

> Take big bites. Anything worth doing is worth overdoing.
>
> [Robert A. Heinlein, <em>Time Enough For Love</em>][quote-cite]

[quote-cite]: https://en.wikipedia.org/wiki/Lazarus_Long#Time_Enough_for_Love

## LINKS

EOF
`

echo "$HEADER" > $INDEX_META

current_year="-"
for name in $(find site/posts -type f -exec basename {} \; | sort -ur | sed 's/\.md//'); do
  year=$(echo $name | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})-(.*)/\1/')
  month=$(echo $name | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})-(.*)/\2/')
  day=$(echo $name | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})-(.*)/\3/')
  title=$(echo $name | sed -E 's/([0-9]{4})-([0-9]{2})-([0-9]{2})-(.*)/\4/' )
  nice_title=$(echo "$(echo ${title:0:1} | tr  '[a-z]' '[A-Z]' )$(echo ${title:1} | sed -e 's/-/ /g') ($year-$month-$day)")
 
  if [ $year != $current_year ]; then
    echo -e "\n### $year\n" >> $INDEX_META
  fi
  current_year=$year
  echo "- [$nice_title](posts/$year-$month-$day-$title.html)" >> $INDEX_META

done