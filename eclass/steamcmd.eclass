# @ECLASS: steamcmd.eclass
# @MAINTAINER:
# Retidurc SilverNight <retidurc@silvernight.social>
# @AUTHOR:
# Retidurc SilverNight <retidurc@silvernight.social>
# @BLURB: Bridge steamcmd to portage
case ${EAPI} in
	7|8) ;;
	*) die "${ECLASS}: EAPI ${EAPI:-0} not supported" ;;
esac

EXPORT_FUNCTIONS src_unpack src_install pkg_setup

if [[ -z ${_STEAMCMD_ECLASS} ]]; then
_STEAMCMD_ECLASS=1

PROPERTIES+="live"
LICENSE="LGPL-2.1+ Steam"
BDEPEND="games-server/steamcmd"

# @ECLASS_VARIABLE: ESTEAM_APPID
# @REQUIRED
# @DESCRIPTION:
# The steam app id

# @FUNCTION: steamcmd_src_unpack
# @USAGE: I dunno
# @DESCRIPTION:
# Fetch from steamcmd
steamcmd_src_unpack() {
#		${T}/steamcmd/steamcmd.sh  +login anonymous +quit
		addpredict /opt/steamcmd/.writable
		addpredict /opt/steamcmd/steam_appid.txt
		einfo "unpacking app id ${ESTEAM_APPID} into ${WORKDIR}"
		"/opt/steamcmd/steamcmd.sh" +force_install_dir "${S}" +login anonymous +app_update ${ESTEAM_APPID}  +quit
}

# @FUNCTION: steamcmd_src_install
# @DESCRIPTION:
# default src_install, wrapper for steamcmd_src_install
steamcmd_src_install(){
	insinto "/var/lib/${PN}"
	doins -r * "/var/lib/${PN}"
}

# @FUNCTION: steamcmd_pkg_setup
# @DESCRIPTION:
# Copy steamcmd into the temp directory, otherwise we get sandbox violations
steamcmd_pkg_setup(){
        /opt/steamcmd/steamcmd.sh +quit
}

_STEAMCMD_ECLASS=1
fi
