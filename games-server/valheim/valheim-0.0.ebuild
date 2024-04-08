# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit steamcmd

DESCRIPTION="Valheim"
ESTEAM_APPID="896660"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
        acct-group/valheim
        acct-user/valheim"
RDEPEND="${DEPEND}"
