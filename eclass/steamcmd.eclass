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

# @FUNCTION: steamcmd_pkg_setup
# @DESCRIPTION:
# Call steamcmd one and exit immediatly, if needed, steamcmd will self-update at this non sandboxed stage.
steamcmd_pkg_setup(){
	einfo "Trigger possible self-update by starting SteamCMD once"
        /opt/steamcmd/steamcmd.sh +quit
	einfo "SteamCDM is now up-to-date"
}

# @FUNCTION: steamcmd_src_unpack
# @USAGE: I dunno
# @DESCRIPTION:
# Fetch from steamcmd
steamcmd_src_unpack() {
		#We need to addpredict thoses two files
		addpredict /opt/steamcmd/.writable #SteamCMD test if it's own directory is writable
		addpredict /opt/steamcmd/steam_appid.txt # Not sure why steamcmd need this one but fair enought, addpredict it. Otherwise, sandbox violation

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

_STEAMCMD_ECLASS=1
fi
