#!/bin/bash
rm *.out
for z in `cat $1`
                do
                echo "$z, " >> $z.out
                a=`(grep ${z}$ $2 | awk '{ print $1 }')`
                        for c in $a ; do
                        echo "$z,$c" >> $z.out
                        d=`(grep [[:space:]]${c}$ $2 | awk '{ print $1 }')`
                                for e in $d ; do
                                echo "$z,$e" >> $z.out
                                f=`(grep [[:space:]]${e}$ $2 | awk '{ print $1 }')`
                                        for g in $f ; do
                                        echo "$z,$g" >> $z.out
                                        h=`(grep [[:space:]]${g}$ $2 | awk '{ print $1 }')`
                                                for i in $h ; do
                                                echo "$z,$i" >> $z.out
                                                j=`(grep [[:space:]]${i}$ $2 | awk '{ print $1 }')`
                                                        for k in $j ; do
                                                        echo "$z,$k" >> $z.out
                                                        l=`(grep [[:space:]]${k}$ $2 | awk '{ print $1 }')`
                                                        done;
        echo $l
                                                done;
                                        done;
                                done;
                        done;
                echo "end,
                " >> $z.out
                done;
cat *.out > $1.csv
