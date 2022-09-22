# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit acct-user

DESCRIPTION="User for Satisfactory server"
ACCT_USER_ID=-1
ACCT_USER_GROUPS=( satisfactory )
ACCT_USER_HOME=/var/lib/satisfactory
ACCT_USER_HOME_PERMS=0700
acct-user_add_deps
