# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Pybricks developer tools"
HOMEPAGE="
	https://gitlab.com/alelec/mpy_cross/
	https://pypi.org/project/mpy-cross-v6/
"

SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

#S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lang/micropython:v6
"

PATCHES=(
	"${FILESDIR}/use-global-mpy-cross-v6.patch"
	"${FILESDIR}/no_mpy-cross-build.patch"
)

#distutils_enable_tests pytest
