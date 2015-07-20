# Copyright (c) 2015 Marek Sapota
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

DESCRIPTION="Build and debug modern web and cloud applications."
HOMEPAGE="https://code.visualstudio.com/"
SRC_URI="http://go.microsoft.com/fwlink/?LinkID=534108 -> VSCode-${PV}.zip"

LICENSE="VSCode"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

src_unpack() {
	mkdir -p "${S}" || die
	cp "${DISTDIR}/${A}" "${S}/VSCode.zip" || die
	cd "${S}" || die
	unzip VSCode.zip || die
}

src_install() {
	rsync -a "${S}/VSCode-linux-x64" "${D}/opt/" || die
	dosym /opt/VSCode-linux-x64/Code /usr/bin/code || die
}
