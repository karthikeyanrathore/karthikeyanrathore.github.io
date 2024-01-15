#!/bin/sh

year=$(date +%Y)
month=$(date +%m)
day=$(date +%d)
filename="$year-$month-$day-$1.markdown"

touch $filename

echo "---
layout: post
title: \"$1\"
date:   $year-$month-$day
categories: topic 
---
" >> $filename
