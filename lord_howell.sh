#!/bin/sh
set -e

if [ -z `which gcc` ]; then
    echo 'Needs GCC.  Please run:'
    echo 'sudo apt install build-essential'
    return
fi

gcc -o /tmp/lord_howell -xc - -lm <<'EOF'
#include <math.h>
#include <unistd.h>

#define v(x) (round((1103.0*pow(x,10.0))/181440.0-(44071.0*pow(x,9.0))/120960.0+(1148309.0*pow(x,8.0))/120960.0-(135439.0*pow(x,7.0))/960.0+(1139201.0*pow(x,6.0))/864.0-(46400003.0*pow(x,5.0))/5760.0+(11751515243.0*pow(x,4.0))/362880.0-(1269412537.0*pow(x,3.0))/15120.0+(1341239309.0*pow(x,2.0))/10080.0-(13790237.0*x)/120.0+40404.0))

int main() {
    char work[13] = {0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x08,0x09,0x0A,0x0B,0x21,0x0A};
    for (int x = 0; x < sizeof(work)-2; x++) work[x] = v(work[x]);
    write(1, work, 13);
    return 0;
}
EOF
/tmp/lord_howell
