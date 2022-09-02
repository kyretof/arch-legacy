#!/bin/bash

prj=$1
dir=~/Projects/$prj

mkdir $dir

mkdir ~/Projects/$prj/img

mkdir ~/Projects/$prj/css

mkdir -p $dir/sass/abstracts $dir/sass/base $dir/sass/components $dir/sass/layouts $dir/sass/pages

touch ~/Projects/$prj/index.html
touch $dir/sass/main.sass

touch $dir/sass/abstracts/_mixins.sass $dir/sass/abstracts/_variables.sass $dir/sass/base/_base.sass $dir/sass/base/_typography.sass $dir/sass/components/_button.sass $dir/sass/layouts/_grid.sass

echo "@import \"abstracts/_mixins\"" >> $dir/sass/main.sass
echo "@import \"abstracts/_variables\"" >> $dir/sass/main.sass

echo "@import \"base/_base\"" >> $dir/sass/main.sass
echo "@import \"base/_typography\"" >> $dir/sass/main.sass

echo "@import \"components/_button\"" >> $dir/sass/main.sass

echo "@import \"layouts/_grid\"" >> $dir/sass/main.sass


