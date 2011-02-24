#
#  #   Perl Oneliners   # 
#      ______________________________
#  
#      Copyright (C) 2010 Ben Leak
#  
#      v0.1, 2010-10-22, <leakin.org>
#      shellenv / oneliners / perl
#      ______________________________
#

perlmodule (){
	module="$1"
	perl -M$module -e 'print "$'$module'::VERSION\n"'
}
