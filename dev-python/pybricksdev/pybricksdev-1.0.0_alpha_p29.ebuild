# Copyright 2021-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

#DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..10} )

inherit distutils-r1

DESCRIPTION="Pybricks developer tools"
HOMEPAGE="
	https://github.com/pybricks/pybricksdev/
	https://pypi.org/project/pybricksdev/
"

# pybricksdev-1.0.0a29.tar.gz
MY_REL_TYPE=$(ver_cut 4)
MY_PV=$(ver_cut 0-3)${MY_REL_TYPE:0:1}$(ver_cut 6)
MY_P="${PN}-${MY_PV}"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${MY_P}.tar.gz"

S="${WORKDIR}/${MY_P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/aioserial-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/argcomplete-1.11.1[${PYTHON_USEDEP}]
	>=dev-python/asyncssh-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.14.1[${PYTHON_USEDEP}]
	>=dev-python/mpy-cross-v5-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.62.3[${PYTHON_USEDEP}]
	>=dev-python/validators-0.18.2[${PYTHON_USEDEP}]
	>=dev-python/pyusb-1.0.2[${PYTHON_USEDEP}]
	>=dev-python/semver-2.13.0[${PYTHON_USEDEP}]
	>=dev-python/appdirs-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/prompt_toolkit-3.0.18[${PYTHON_USEDEP}]
	>=dev-python/Rx-3.2.0[${PYTHON_USEDEP}]
	>=dev-python/mpy-cross-v6-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-21.3[${PYTHON_USEDEP}]
	net-wireless/bluez[readline]
"

DEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.18.3[${PYTHON_USEDEP}]
	)
"

#	>=dev-python/decorator-3.4.0[${PYTHON_USEDEP}]

distutils_enable_tests pytest
