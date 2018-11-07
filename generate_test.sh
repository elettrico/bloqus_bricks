#!/bin/bash

# generate a file with all the textures
# the file define a lua array to be used with add_simple_node function

# create an array with all the .png files inside textures
arr=(./textures/*.png)

# destination
DEST=bricks.lua

echo "function get_simple_nodes() " > $DEST
echo "simple_nodes = {" >> $DEST

# iterate through array using a counter
for f in "${arr[@]}"; do
    BLOCK=""
    SP=0
    # take basename and split it at underscore, format is like this: register-name_spflag_block-description.png 
    FILE=`basename "$f" .png`
    IFS=_ read -ra arr <<< "$FILE"
    REGISTERNAME=${arr[0]}
    REGISTERSP=${arr[1]}
    BLOCKDESC=${arr[2]}

    # if the filename contains the sp flag, put up the flag for registering with stairs plus
    if [[ "$REGISTERSP" -eq "1" ]] 
    then
        SP=1
    fi
    # change "-" to "_" in registername
    REGISTERNAME=${REGISTERNAME//-/_}
    # si no tenemos nombre, usamos el base
    if [[ -z "$BLOCKDESC" ]]
    then
        BLOCKDESC=${REGISTERNAME//-/ }
    else
        BLOCKDESC=${BLOCKDESC//-/ }
    fi
    echo
    echo "registering '$f' as:"
    echo "    file basename...: $FILE"
    echo "    node description: $BLOCKDESC"
    echo "    node name.......: $REGISTERNAME"
    echo "    stairs plus.....: $REGISTERSP -> $SP"
    LINE="{\"$BLOCKDESC\",\"$REGISTERNAME\",\"$FILE\",\"\",\"$SP\"}, "
    echo "    $LINE"
    # --   1: node description, 
    # --   2: node name, 
    # --   3: node side texture, 
    # --   4: node up and down texture or "" (in this case side texture is used)
    # --   5: if 1, register node with stairsplus
    echo $LINE >> $DEST
done

echo "}" >> $DEST
echo "return simple_nodes" >> $DEST
echo "end" >> $DEST
