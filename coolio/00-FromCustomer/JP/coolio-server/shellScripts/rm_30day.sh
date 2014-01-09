#!/bin/bash

rm_30day_exec(){
    find /home/coolio/public/picture/ -mtime +30 -exec /bin/rm -f {} \;
    find /home/coolio/public/picture/ -ctime +30 -exec /bin/rm -f {} \;
}

rm_30day_exec

