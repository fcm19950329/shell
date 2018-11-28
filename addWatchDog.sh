#！/bin/bash
addWatchDog()
{
        oldwd=`pwd`
        base_dir="/usr/local/watch/check_process.txt"
        content="$oldwd/ins.sh start :pid.file"
        flag=0
        touch t1.txt
        cat $base_dir > t1.txt
         while read line
        do
            new_str=$(echo $line | cut -d " " -f1)
            if [ "$new_str" = "$oldwd/ins.sh" ];then
                    let "flag=flag+1"
                    echo $flag
            fi
         done<t1.txt
         rm /tmp/t1.txt -f
         echo $flag
         if [ $flag = 0 ];then                                                                                                                                                      echo -e $content >> $base_dir
         fi
}
addWatchDog