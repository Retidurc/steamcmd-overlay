# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit steamcmd

DESCRIPTION="Palworld"
ESTEAM_APPID="2394010"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
        acct-group/palworld
        acct-user/palworld"
RDEPEND="${DEPEND}"
