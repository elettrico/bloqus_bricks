#!/bin/bash

# generate a file with all the textures
# the file define a lua array to be used with add_simple_node function

# create an array with all the filer/dir inside ~/myDir
arr=(./textures/*)

echo "function get_simple_nodes() " > test.lua
echo "simple_nodes = {" >> test.lua

# iterate through array using a counter
for f in "${arr[@]}"; do
   FILE=`basename "$f" .png`
   BLOCK=${FILE//-/_}
   NAME=${FILE//-/ }
   echo '{"'$NAME'","'test_$BLOCK'","'$FILE'",""}, ' >> test.lua
   echo '{"'$NAME'","'test_$BLOCK'","'$FILE'",""}, '
done

echo "}" >> test.lua
echo "return simple_nodes" >> test.lua
echo "end" >> test.lua
