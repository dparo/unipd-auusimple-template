#!/bin/bash

echo "[Starting installation]"

#detect OS
os_type=$(uname -s)

echo "Detecting OS..."

#place folders based on OS
if [ "$os_type" == "Darwin" ]; then
    install_folder=~/Library/texmf
    echo "Detected Mac OS X"
elif [ "$os_type" == "Linux" ]; then
    install_folder=~/texmf
    echo "Detected Linux"
else
    echo "Could not detect OS type... Exciting"
    exit
fi


#make folders - sty
mkdir -p $install_folder/tex/latex/beamer/themes/{color,inner,outer,theme}

#make folders - for graphics
mkdir -p $install_folder/tex/generic/images

#copy .sty files to coresponding folders
for beamer_temp in AAUsimple; do
    beamer_temp_lower=$(echo "$beamer_temp" | awk '{print tolower($0)}')
    cp beamer/beamercolortheme$beamer_temp.sty $install_folder/tex/latex/beamer/themes/color/
    cp beamer/beamerinnertheme$beamer_temp.sty $install_folder/tex/latex/beamer/themes/inner/
    cp beamer/beameroutertheme$beamer_temp.sty $install_folder/tex/latex/beamer/themes/outer/
    cp beamer/beamertheme$beamer_temp.sty $install_folder/tex/latex/beamer/themes/theme/
done

#copy graphics
cp -R beamer/logos $install_folder/tex/generic/
cp -R aauPoster/AAUgraphics $install_folder/tex/generic/
cp -R aauReportTemplate/AAUgraphics $install_folder/tex/generic/

echo "[Installation done]"


