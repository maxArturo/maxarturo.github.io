#! /usr/bin/env bash
INDEX_META=site/posts.md

rm -f $INDEX_META

HEADER=`cat <<EOF
---
title: Posts
---
<section>

<span class="newthought">I've written a series of posts</span>, on and off, since about early 2014 in my personal webpage. Sometimes the 
site has gone derelict, suffering the same kind of abandon and rot that other personal effects do when 
you're busy making other plans[^ref]. 

[^ref]:
  I'd love to attribute this to John Lennon. However, a [cursory search](https://quoteinvestigator.com/2012/05/06/other-plans/) will
  lead you down to [biblical sources](https://quoteinvestigator.com/2012/05/06/other-plans/#f+3760+1+8) as precursos to the quote. 
  I truly doubt that it is the oldest instance of *"Man Proposes, God Disposes"* in extant literature. 
  But the proof of this hypothesis is left to the reader.

I've recently revamped the layout, streamlining both the [delivery](https://github.com/maxArturo/maxarturo.github.io) and 
content-matter. The hope is to make sure nothing gets in the way of writing more often – both for my own benefit and as a 
practice of habit. I hope you find these entertaining; they really are a snapshot of where I've been and who I was at the
time.

</section>

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