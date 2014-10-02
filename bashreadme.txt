#file exist
[ -e /path/tofile ]
-f is regular file
-d file is a directory


#directory exist
[ -d /path/todir ]

#number compare
[ $n -eq 5 ]
-eq
-nt
-gt
-ge
-lt
-le
#string
= and == are synonym
!=
-z empty string (null)
-n not zero


    *    $0 ： ./test.sh,即命令本身，相当于C/C++中的argv[0]
    *    $1 ： -f,第一个参数.
    *    $2 ： config.conf
    *    $3, $4 ... ：类推。
    *    $#  参数的个数，不包括命令本身，上例中$#为4.
    *    $@ ：参数本身的列表，也不包括命令本身，如上例为 -f config.conf -v --prefix=/home
    *    $* ：和$@相同，但"$*" 和 "$@"(加引号)并不同，"$*"将所有的参数解释成一个字符串，而"$@"是一个参数数组。如下例所示：

 for arg in "$@"
 do
     echo $arg
 done


while getopts "a:bc" arg #选项后面的冒号表示该选项需要参数
do
        case $arg in
             a)
                echo "a's arg:$OPTARG" #参数存在$OPTARG中
                ;;
             b)
                echo "b"
                ;;
             c)
                echo "c"
                ;;
             ?)  #当有不认识的选项的时候arg为?
            echo "unkonw argument"
        exit 1
        ;;
        esac
done

声明一个数组：
declare -a array

如果没有声明，按数组方式直接赋值给变量，BASH也认作数组：
(1) array=(var1 var2 var3 ... varN)
(2) array=([0]=var1 [1]=var2 [2]=var3 ... [n]=varN)
(3) array[0]=var1
    arrya[1]=var2
    ...
    array[n]=varN

数组用法说明：
${array[n]}                     # 引用数组
${array[*]} 或${array[@]}       # 数组所有成员
${!array[*]} 或${!array[@]}     # 数组所有下标
${#array[*]} 或${#array[@]}     # 数组元素个数
${#array[0]}                    # 数组第一个成员的长度

for item in ${COLOR[*]}
 do
     printf "   %s/n" $item
 done
