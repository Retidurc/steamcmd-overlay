# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit steamcmd

DESCRIPTION="Satisfactory"
ESTEAM_APPID="1690800"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
        acct-group/satisfactory
        acct-user/satisfactory"
RDEPEND="${DEPEND}"
