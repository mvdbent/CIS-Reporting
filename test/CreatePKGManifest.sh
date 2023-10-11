#!/bin/sh

####################################################################################################
#        License information
####################################################################################################
#
#        THE SCRIPTS ARE PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
#        INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY 
#        AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
#        I BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, 
#        OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
#        SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
#        INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
#        CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
#        ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
#        THE POSSIBILITY OF SUCH DAMAGE.
#
####################################################################################################
# 
# Version 1.0
# Written by: Mischa van der Bent
#
# DESCRIPTION
# This script creates a manifest file for JAMF Pre-stage Deployments packages 
# 
# More info here 
# https://learn.jamf.com/bundle/jamf-pro-documentation-10.40.0/page/Computer_PreStage_Enrollments.html
# 
# REQUIREMENTS
# Signed Distribution package
# 
####################################################################################################
####################################################################################################

if [[ $1 = "" ]]; then
    echo "Missing package path"
    echo "Example: */path/to/pkg *URL"
    exit 1
elif [[ $2 = "" ]]; then
    echo "Missing URL"
    echo "Example: */path/to/pkg *URL"
    exit 1
else
    pkgPath=$1
    url=$2
fi

md5=$(md5 $pkgPath | awk '{print $NF}')
byteSize=$(stat -f%z $pkgPath)

echo '<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>items</key>
    <array>
      <dict>
        <key>assets</key>
        <array>
          <dict>
            <key>kind</key>
            <string>software-package</string>
            <key>md5-size</key>
            <integer>'$byteSize'</integer>
            <key>md5s</key>
            <array>
              <string>'$md5'</string>
            </array>
            <key>url</key>
            <string>'$url'</string>
          </dict>
        </array>
      </dict>
    </array>
  </dict>
</plist>' > /Users/Shared/manifest.plist

open /Users/Shared