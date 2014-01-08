# Copyright (c) 2013, 2014 Marek Sapota
#
# Permission is hereby granted, free of charge, to any person
# obtaining a copy of this software and associated documentation
# files (the "Software"), to deal in the Software without
# restriction, including without limitation the rights to use,
# copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the
# Software is furnished to do so, subject to the following
# conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
# OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE

EAPI=5

DESCRIPTION="Ubuntu kernel config"
HOMEPAGE="http://kernel.ubuntu.com/~kernel-ppa"
SRC_URI="http://kernel.ubuntu.com/~kernel-ppa/mainline/v3.12.6-trusty/linux-image-3.12.6-031206-generic_3.12.6-031206.201312201218_amd64.deb"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
SLOT="${PVR}"

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}" || die
	cp "${DISTDIR}/${A}" "${S}/linux-image.deb" || die
	cd "${S}" || die
	ar x linux-image.deb || die
	tar xf data.tar.bz2 || die
	cp boot/config-${PV}-*-generic kernel-config-x86_64-${PV}-gentoo || die
}

src_install() {
	cd "${S}" || die
	mkdir -p "${D}/etc/kernels" || die
	cp kernel-config-x86_64-${PV}-gentoo "${D}/etc/kernels" || die
}
