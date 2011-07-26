#!/bin/sh

SCRIPT=$1

FIRST=$(head -c 21 $1)
if [ ! "$FIRST" = "#!/usr/bin/env python" ] ; then
    echo "$1: FAIL, MISSING #!/usr/bin/env python"
    return 1
fi
if [ ! -x $1 ] ; then
    echo "$1: FAIL not executable"
fi

return 0