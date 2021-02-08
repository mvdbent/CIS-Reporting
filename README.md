# CIS-Reporting

_**Current state of the scripts are:** "The scripts is "As is" please be free to give me any feedback_

```THE SCRIPTS ARE PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, 
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY 
AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
I BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, 
OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF 
THE POSSIBILITY OF SUCH DAMAGE.
```

![GitHub](https://img.shields.io/github/license/mvdbent/CIS-Reporting)

##DESCRIPTION
This script creates a report of the audit based on orgSecurityScore or for each listed item in the CIS Benchmark script of Jamf's CIS Benchmark, Script and Configuration Profile Remediation tool [here](https://github.com/jamf/CIS-for-macOS-Catalina-CP)

## Info
While i was working with Jamf's CIS Benchmark, Script and Configuration Profile Remediation tool ), I had the feeling there was missing a overview with compleet reporting. You can find some info by the device record in Jamf, however this was only for the Non-compliant items.

The security report creates a compleet reporting overview of the CIS Security State of your device. This report does only reporting on the state, and doesn't change anything on the device. The result is a .csv file, including a remediation instructions. 

## Usage/Requirements
***Script must be run as root, or have root privileges***

* This script is tested on macOS Big Sur 11.*
* Reporting document will be stored in the folder "Reports" at the same location as the script.
* When the script is done, the report will be opend in Numbers, Microsoft Excel or other prefered text editor of your choice.


### Reporting all or use organizational compliance scoring

Build-in option, the option to choose orgSecurityScore (0) or for reporting all (1), no need for an organizational compliance scoring to see the CIS Security State of your device.

```bash
# set to 0 for orgSecurityScore, 1 for reporting all
orgSecurityScore=0
```
### Example
<img src="https://github.com/mvdbent/CIS-Reporting/Scoring.png" width="250">
