#!/bin/bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:~/compiler/lib
cd gamemodes
~/compiler/pawncc -i../include -d3 "-;+" "-(+" Mrucznik-RP.pwn
