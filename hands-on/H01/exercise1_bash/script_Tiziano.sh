#! /bin/bash

mkdir -p new_names
pushd bandpasses

for f in $(ls )
do
    ar=(${f//./ })
    name=${ar[0]}
    ext=${ar[1]}

    if grep -q "^#\s*photon" "$f"; then
        prop=photon
    elif grep -q "^#\s*energy" "$f"; then
        prop=energy
    else
        prop=unknown
    fi

    cp $name.$ext ../new_names/$name.$prop.filt
done

popd
