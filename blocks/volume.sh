#!/bin/sh
pacmd list-sinks |
    awk '
        BEGIN {
            ICONsn = "  " # headphone unplugged, not muted
            ICONsm = "  " # headphone unplugged, muted
            ICONhn = "  " # headphone plugged in, not muted
            ICONhm = "  " # headphone plugged in, muted
        }
        {
            if (f) {
                if ($1 == "index:") {
                    exit
                }
                if ($1 == "muted:" && $2 == "yes") {
                    m = 1
                } else if ($1 == "volume:") {
                    if ($3 == $10) {
                        vb = $5
                    } else {
                        vl = $5
                        vr = $12
                    }
                } else if ($1 == "active" && $2 == "port:" && $3 ~ /headphone/) {
                    h = 1
                }
            } else if ($1 == "*" && $2 == "index:") {
                f = 1
            }
        }
        END {
            if (f) {
                printf "%s", h ? (m ? ICONhm : ICONhn) : (m ? ICONsm : ICONsn)
                if (vb) {
                    print vb
                } else {
                    printf "L%s R%s\n", vl, vr
                }
            }
        }
    '
