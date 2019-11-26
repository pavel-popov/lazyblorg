#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

TARGETDIR=rendered/
rm -rf $TARGETDIR

# create the output directory (and parents):
mkdir -p $TARGETDIR

# get help on the following parameters: «python ./lazyblorg.py --help»

# when setting up your own system, you might want to:
# 1. have separate directories for generating your blog and staging/publishing your blog
# 2. rename everything with «2del» to an appropriate name
# 3. copy generated blog data to staging/publishing directory
# 4. point --previous-metadata to the corresponding pk-file in your staging/publishing directory
# 5. modify --orgfiles so that your org-mode files are parsed
#    don't forget to include your version of «about-placeholder.org» and «blog-format.org»

./lazyblorg.py \
    --targetdir $TARGETDIR \
    --previous-metadata ./pavel-popov-metadata.pk \
    --new-metadata ./pavel-popov-new-metadata.pk \
    --logfile ./pp.org \
    --orgfiles ~/Documents/org/pavel.org \
               ~/Documents/FindHotel/fh.org \
               templates/blog-format.org $@


# copy assets
mkdir $TARGETDIR/assets
cp templates/*.css $TARGETDIR/assets/

#END
