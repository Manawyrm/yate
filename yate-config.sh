#! /bin/sh

if [ ! -f configure ]; then
    echo "Cannot find configure" >&2
    exit 1
fi

exec > yate-config.in < configure

cat <<"EOF"
ustr='Usage: yate-config [--cflags] [--includes] [--c-all]
                   [--ldflags] [--libs] [--ld-all] [--ld-nostrip] [--ld-strip]
		   [--config] [--modules] [--share]
		   [--helpdir] [--scripts] [--skins]
		   [--version] [--release] [--archlib] [--param=...]'
if [ "$#" = 0 ]; then
    echo "$ustr"
    exit 0
fi
prefix="@prefix@"
exec_prefix="@exec_prefix@"
datarootdir="@datarootdir@"
shrdir="@datadir@/yate"
moddir="@libdir@/yate"
confdir="@sysconfdir@/yate"
s1="@MODULE_CPPFLAGS@"
s2="-I@includedir@/yate"
s3="@MODULE_LDFLAGS@"
s4="@MODULE_SYMBOLS@"
s5="-lyate"

while [ "$#" != 0 ]; do
    case "$1" in
	--version)
	    echo "@PACKAGE_VERSION@"
	    ;;
	--release)
	    echo "@PACKAGE_STATUS@@PACKAGE_RELEASE@"
	    ;;
	--cflags)
	    echo "$s1"
	    ;;
	--includes)
	    echo "$s2"
	    ;;
	--c-all)
	    echo "$s1 $s2"
	    ;;
	--ldflags)
	    echo "$s3 $s4"
	    ;;
	--libs)
	    echo "$s5"
	    ;;
	--ld-all)
	    echo "$s3 $s4 $s5"
	    ;;
	--ld-nostrip)
	    echo "$s3 $s5"
	    ;;
	--ld-strip)
	    echo "$s4"
	    ;;
	--config)
	    echo "$confdir"
	    ;;
	--modules)
	    echo "$moddir"
	    ;;
	--share)
	    echo "$shrdir"
	    ;;
	--helpdir)
	    echo "$shrdir/help"
	    ;;
	--skins)
	    echo "$shrdir/skins"
	    ;;
	--scripts)
	    echo "$shrdir/scripts"
	    ;;
	--archlib)
	    echo "@ARCHLIB@"
	    ;;
EOF

pos=__
while read REPLY; do
    case "x$pos$REPLY" in
	x__ac_subst_vars=*)
	    pos=""
	    ;;
	x__*)
	    ;;
	x*"'"*)
	    pos=__
	    ;;
	xPACKAGE_*|xECHO_*|xPATH_SEPARATOR|xCONFIGURE_FILES)
	    ;;
	xMUTEX_HACK|xTHREAD_KILL|xFDSIZE_HACK|xMUTEX_HACK)
	    ;;
	x*_alias|x*_prefix|xprogram_*)
	    ;;
	x[A-Z]*_*)
	    echo "	--param=$REPLY)"
	    echo "	    echo \"@$REPLY@\""
	    echo "	    ;;"
    esac
done

cat <<"EOF"
	*)
	    echo "I didn't understand: $1" >&2
	    echo "$ustr" >&2
	    exit 1
	    ;;
    esac
    shift
done
EOF