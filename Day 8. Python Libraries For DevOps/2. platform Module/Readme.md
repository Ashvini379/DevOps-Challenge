Platform module is used to access underlying platform data such as operating system, interpreter version information, and hardware. It has also been used to write cross-platform script.

```
import platform
import sys
#Various architecture information
platform.architecture(executable=sys.executable, bits='', linkage='')
#Returns machine type
platform.machine()
#returns computer network name
platform.node()
#Returns a single string identifying the underlying platform with as much useful information as possible.
platform.platform(aliased=False,terse=False)
#returns processor name
platform.processor()
#returns system release
platform.release()
#returns system os name
platform.system()
#Fairly portable uname interface. Returns containing six attributes: system, node, release, version, machine, and processor.
platform.uname()
#Returns a string identifying the compiler used for compiling Python.
platform.python_compiler()
#Returns the Python version as string.
platform.python_version()
#Returns a tuple (release, vendor, vminfo, osinfo) with vminfo being a tuple (vm_name, vm_release, vm_vendor) and osinfo being a tuple (
platform.java_ver(release='', vendor='', vminfo=('', '', ''), osinfo=('', '', ''))
#return a tuple (release, version, csd, ptype) referring to OS release, version number, CSD level (service pack) and OS type (multi/single processor).
platform.win32_ver(release='', version='', csd='', ptype='')
```
