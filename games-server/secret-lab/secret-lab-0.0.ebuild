# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit steamcmd

DESCRIPTION="Scp Secret-Lab"
ESTEAM_APPID="996560"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

DEPEND="
        acct-group/secretlab
        acct-user/secretlab"
RDEPEND="${DEPEND}"
