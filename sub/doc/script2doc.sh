#!/bin/bash
#
# (c) 2011 Ben, untar.org

TITLE='script2doc - convert a shell script in to man compatible markdown'

DESCRIPTION='A shell script containing a few predefined variables is converted into a markdown formatted text file. This for further conversion into a man page.'

USAGE="script2doc OPTIONS file"

OPT[0]="-f | --format <output>    valid outputs are: html,pod,asciidoc,pandoc"

FILE=''
format=''

set -e

die () {
    echo >&2 "$@" && exit 1
}

usage () {
    die "Usage: $CMD $USAGE"
}

while [ "$1" != '' ]; do
    case "$1" in 
        -h | --help)
            usage
            ;;
        -f | --format )
            shift
            format="$1"
            if [ -z $format ]; then 
                die "Error: No format defined"
            fi
            shift
            if [ -z "$1" ];then 
                usage; 
            else
                FILE="$1"
            fi
            ;;
        -*)
            usage
            ;;
        *)
            usage
            ;;
    esac
    shift
done
if [ ! -f "$FILE" ] ; then
    die "Error: The file '$FILE' is not a valid input"
fi
CMD='', TITLE='', DESCRIPTION='', USAGE='', USAGE_LONG=''
 perl -ne 'print if /CMD=/ || /TITLE=/ || /DESCRIPTION=/ || /USAGE=/ || /OPT\[\d\]=/ ' $FILE > vars

. vars
rm -f ./vars

UCMD=$(perl -e 'print uc $ARGV[0]' $CMD)
UFCMD=$(perl -e 'print ucfirst $ARGV[0]' $CMD)
dt=$(date +"%Y-%m-%d")

if [ "$format" = 'html' ]; then
    echo "<html>"
    echo "<head><title>$CMD Manual Page</title></head>"
    echo "<body>"
    echo "<h1> $UCFMD</h1>"
    echo "<h2>NAME</h2>"
    echo "<p>$CMD - $TITLE</p>"
    echo "<h2>SYNOPSIS</h2>"
    echo "<p><b>$CMD</b> $USAGE</p>"
    echo ""
    echo "<h2>OPTIONS</h2>"
    echo ""
    echo "<ul>"
    for o in "${OPT[@]}"; do
        echo "<li>$o"
        echo ""
    done
    echo "</ul>"
    echo ""
    echo "<h2>DESCRIPTION</h2>"
    echo "<p>$DESCRIPTION</p>"
    echo "</body></html>"
elif [ "$format" = 'man' ]; then
    echo ".TH $UCMD 1"
    echo '.PP'
    echo '.SH NAME'
    echo '.PP'
    echo "$CMD - $TITLE"
    echo '.SH SYNOPSIS'
    echo '.PP'
    echo "$CMD $USAGE"
    echo '.SH OPTIONS'
    for o in "${OPT[@]}"; do
        echo '.IP \[bu] 2'
        echo "$o"
    done
    echo '.SH DESCRIPTION'
    echo '.PP'
    echo "$DESCRIPTION"
    echo ''
elif [ "$format"  = 'pod' ]; then
    echo "=head1 NAME"
    echo ""
    echo "$CMD - $TITLE"
    echo ""
    echo "=head1 SYNOPSIS"
    echo ""
    echo "$CMD $USAGE"
    echo ""
    echo "=head1 OPTIONS"
    echo ""
    echo "=over 4"
    echo ""
    for o in "${OPT[@]}"; do
        echo "=item * $o"
        echo ""
    done
    echo ""
    echo "=back"
    echo ""
    echo "=head1 DESCRIPTION"
    echo ""
    echo "$DESCRIPTION"
elif [ "$format" = 'pandoc' ]; then
    echo "% $UCMD(1)"
    echo "% $USERNAME"
    echo "% $dt"
    echo ""
    echo "# NAME"
    echo ""
    echo "$CMD - $TITLE"
    echo ""
    echo "# SYNOPSIS"
    echo ""
    echo "$CMD $USAGE"
    echo ""
    echo "# OPTIONS"
    echo ""
    for o in "${OPT[@]}"; do
        printf ' * \%s\n' "$o"
        echo ""
    done
    echo ""
    echo ""
    echo "# DESCRIPTION"
    echo ""
    echo "$DESCRIPTION"
    echo ""
elif [ "$format" = 'asciidoc' ]; then
    echo "= $UCMD(1)"
    echo ":doctype: manpage"
    echo ""
    echo ""
    echo "== NAME"
    echo ""
    echo "$CMD - $TITLE"
    echo ""
    echo "== SYNOPSIS"
    echo ""
    echo "*$CMD* '$USAGE'"
    echo ""
    echo "== OPTIONS"
    echo ""
    for o in "${OPT[@]}"; do
        printf ' * %s\n' "$o"
        echo ""
    done
    echo ""
    echo "== DESCRIPTION"
    echo ""
    echo "$DESCRIPTION"
    echo ""
else
    die "Error: Outputformat '$format' doesn't exist."
fi
