#!/usr/bin/env bash

# ---------------------------------------------------------------------------
# This file is part of noah.
#
# (c) Brian Faust <hello@brianfaust.me>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
# ---------------------------------------------------------------------------

database_drop_user()
{
    sudo -u postgres dropuser --if-exists $USER >> $noah_log 2>&1
}

database_destroy()
{
    sudo -u postgres dropdb --if-exists ark_${network} >> $noah_log 2>&1
}

database_create()
{
    sleep 1
    sudo -u postgres psql -c "update pg_database set encoding = 6, datcollate = 'en_US.UTF8', datctype = 'en_US.UTF8' where datname = 'template0';" >> $noah_log 2>&1
    sudo -u postgres psql -c "update pg_database set encoding = 6, datcollate = 'en_US.UTF8', datctype = 'en_US.UTF8' where datname = 'template1';" >> $noah_log 2>&1
    sudo -u postgres psql -c "CREATE USER $USER WITH PASSWORD 'password' CREATEDB;" >> $noah_log 2>&1
    sleep 1
    createdb ark_${network}
}
