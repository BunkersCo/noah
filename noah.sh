#!/usr/bin/env bash

# ---------------------------------------------------------------------------
# This file is part of noah.
#
# (c) Brian Faust <hello@brianfaust.me>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
# ---------------------------------------------------------------------------

# -------------------------
# Required Variables
# -------------------------

noah=$(basename "$0")
noah_dir=$(dirname "$0")
noah_log="${noah_dir}/noah.log"

# -------------------------
# Modules
# -------------------------

. "$noah_dir/modules/colors.sh"
. "$noah_dir/modules/errors.sh"
. "$noah_dir/modules/bootstrap.sh"
. "$noah_dir/modules/config.sh"
. "$noah_dir/modules/night-mode.sh"
. "$noah_dir/modules/ark.sh"
. "$noah_dir/modules/processes.sh"
. "$noah_dir/modules/notifications.sh"
. "$noah_dir/modules/database.sh"
. "$noah_dir/modules/snapshot.sh"
. "$noah_dir/modules/rebuild.sh"
. "$noah_dir/modules/relay.sh"
. "$noah_dir/modules/monitor.sh"
. "$noah_dir/modules/commands.sh"
. "$noah_dir/modules/install.sh"
. "$noah_dir/modules/args.sh"

# -------------------------
# Start
# -------------------------

function main()
{
    setup_environment
    check_configuration

    parse_args "$@"

    trap cleanup SIGINT SIGTERM SIGKILL
}

main "$@"
