#!/bin/bash
addWatchDog()
{
        base_dir="he.txt"
        i=0
        touch t2.txt
        cat $base_dir > t2.txt
        while read line
                do
                        arr[${i}]=`echo ${line}`
                        num[${i}]=0
                        ((++i))

                done<t2.txt
        #去重
        for(( m=0;m<${#arr[@]};m++))
        do
                echo ${arr[m]}
                for(( n=m+1;n<${#arr[@]};n++))
                do
                        if [ "${arr[m]}" = "${arr[n]}" ];then
                                num[n]=1
                        fi
                done
        done
        rm -rf he.txt
        touch he.txt
        for(( j=0;j<${#arr[@]};j++))
        do
                echo ${num[j]}
                if [ "${num[j]}" = "0" ];then
                        echo ${arr[j]} >> he.txt
                fi
        done

}

addWatchDog
