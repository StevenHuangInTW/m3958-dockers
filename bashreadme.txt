http://www.gb.nrao.edu/~jford/bash/bashref.html

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


The `$' character introduces parameter expansion, command substitution, or arithmetic expansion. The parameter name or symbol to be expanded may be enclosed in braces, which are optional but serve to protect the variable to be expanded from characters immediately following it which could be interpreted as part of the name.

When braces are used, the matching ending brace is the first `}' not escaped by a backslash or within a quoted string, and not within an embedded arithmetic expansion, command substitution, or parameter expansion.

The basic form of parameter expansion is ${parameter}. The value of parameter is substituted. The braces are required when parameter is a positional parameter with more than one digit, or when parameter is followed by a character that is not to be interpreted as part of its name.

If the first character of parameter is an exclamation point, a level of variable indirection is introduced. Bash uses the value of the variable formed from the rest of parameter as the name of the variable; this variable is then expanded and that value is used in the rest of the substitution, rather than the value of parameter itself. This is known as indirect expansion.

In each of the cases below, word is subject to tilde expansion, parameter expansion, command substitution, and arithmetic expansion. When not performing substring expansion, Bash tests for a parameter that is unset or null; omitting the colon results in a test only for a parameter that is unset.

${parameter:-word}
If parameter is unset or null, the expansion of word is substituted. Otherwise, the value of parameter is substituted.
${parameter:=word}
If parameter is unset or null, the expansion of word is assigned to parameter. The value of parameter is then substituted. Positional parameters and special parameters may not be assigned to in this way.
${parameter:?word}
If parameter is null or unset, the expansion of word (or a message to that effect if word is not present) is written to the standard error and the shell, if it is not interactive, exits. Otherwise, the value of parameter is substituted.
${parameter:+word}
If parameter is null or unset, nothing is substituted, otherwise the expansion of word is substituted.
${parameter:offset}
${parameter:offset:length}
Expands to up to length characters of parameter, starting at the character specified by offset. If length is omitted, expands to the substring of parameter, starting at the character specified by offset. length and offset are arithmetic expressions (see section Shell Arithmetic). This is referred to as Substring Expansion. length must evaluate to a number greater than or equal to zero. If offset evaluates to a number less than zero, the value is used as an offset from the end of the value of parameter. If parameter is `@', the result is length positional parameters beginning at offset. If parameter is an array name indexed by `@' or `*', the result is the length members of the array beginning with ${parameter[offset]}. Substring indexing is zero-based unless the positional parameters are used, in which case the indexing starts at 1.
${#parameter}
The length in characters of the expanded value of parameter is substituted. If parameter is `*' or `@', the value substituted is the number of positional parameters. If parameter is an array name subscripted by `*' or `@', the value substituted is the number of elements in the array.
${parameter#word}
${parameter##word}
The word is expanded to produce a pattern just as in filename expansion (see section Filename Expansion). If the pattern matches the beginning of the expanded value of parameter, then the result of the expansion is the expanded value of parameter with the shortest matching pattern (the `#' case) or the longest matching pattern (the `##' case) deleted. If parameter is `@' or `*', the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@' or `*', the pattern removal operation is applied to each member of the array in turn, and the expansion is the resultant list.
${parameter%word}
${parameter%%word}
The word is expanded to produce a pattern just as in filename expansion. If the pattern matches a trailing portion of the expanded value of parameter, then the result of the expansion is the value of parameter with the shortest matching pattern (the `%' case) or the longest matching pattern (the `%%' case) deleted. If parameter is `@' or `*', the pattern removal operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@' or `*', the pattern removal operation is applied to each member of the array in turn, and the expansion is the resultant list.
${parameter/pattern/string}
${parameter//pattern/string}
The pattern is expanded to produce a pattern just as in filename expansion. Parameter is expanded and the longest match of pattern against its value is replaced with string. In the first form, only the first match is replaced. The second form causes all matches of pattern to be replaced with string. If pattern begins with `#', it must match at the beginning of string. If pattern begins with `%', it must match at the end of string. If string is null, matches of pattern are deleted and the / following pattern may be omitted. If parameter is `@' or `*', the substitution operation is applied to each positional parameter in turn, and the expansion is the resultant list. If parameter is an array variable subscripted with `@' or `*', the substitution operation is applied to each member of the array in turn, and the expansion is the resultant list.
