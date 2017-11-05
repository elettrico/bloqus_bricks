#!/bin/bash

# generate a file with all the textures
# the file define a lua array to be used with add_simple_node function

# create an array with all the .png files inside textures
arr=(./textures/*.png)

echo "function get_simple_nodes() " > test.lua
echo "simple_nodes = {" >> test.lua

# iterate through array using a counter
for f in "${arr[@]}"; do
    FILE=`basename "$f" .png`
    if [[ "$FILE" == *-sp ]] 
    then
        BASE=${FILE//-sp/}
        SP=1
    else
        BASE=$FILE
        SP=0
    fi
    BLOCK=${BASE//-/_}
    NAME=${BASE//-/ }
    echo '{"'$NAME'","'test_$BLOCK'","'$FILE'","",'$SP'}, ' >> test.lua
    echo '{"'$NAME'","'test_$BLOCK'","'$FILE'","",'$SP'}, '
done

echo "}" >> test.lua
echo "return simple_nodes" >> test.lua
echo "end" >> test.lua
