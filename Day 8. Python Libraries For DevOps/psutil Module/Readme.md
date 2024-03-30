# psutil Module
psutil (process and system utilities) is a cross-platform library for retrieving information on running processes and system utilization (CPU, memory, disks, network, sensors) in Python. It is useful mainly for system monitoring, profiling and limiting process resources and management of running processes.

## CPU.
```
import psutil
#CPU
#psutil.cpu_times()- This function gives system CPU times as a named tuple.
#Parameters:  
#user – time spent by normal processes executing in user mode
#system – time spent by processes executing in kernel mode
#idle – time when system was idle
#nice – time spent by priority processes executing in user mode
#iowait – time spent waiting for I/O to complete. This is not accounted in idle time counter.
#irq – time spent for servicing hardware interrupts
#softirq – time spent for servicing software interrupts
#steal – time spent by other operating systems running in a virtualized environment
#guest – time spent running a virtual CPU for guest operating systems under the control of 
#the Linux kernel
psutil.cpu_times()
#psutil.cpu_percent(1) -current system CPU utilization in percentage
print(psutil.cpu_percent(1))

#It counts logical or physical core in system using logical=true/false flag
print("Number of cores in system", psutil.cpu_count(logical=True))

#psutil.cpu_stats() -This function gives CPU statistics as a named tuple. The statistics includes : 
#ctx_switches – number of context switches since boot.
#interrupts – number of interrupts since boot.
#soft_interrupts – number of software interrupts since boot.
#syscalls – number of system calls since boot. Always set to 0 in Ubuntu.
print("CPU Statistics", psutil.cpu_stats())

#psutil.cpu_freq() – This gives CPU frequency as a tuple that includes current, min and 
#max frequencies expressed in Mhz.
print(psutil.cpu_freq())

#psutil.getloadavg() – This function gives the average system load
print(psutil.getloadavg())
```

## Memory
```
import psutil
#Memory
#psutil.virtual_memory() - This gives information about physical memory
psutil.virtual_memory()
#psutil.swap_memory() - Details of swap memory
psutil.swap_memory()
```
## Disks
```
import psutil
#Disks
#psutil.disk_partitions() - details of all mounted disk partitions like device, 
#mount point and filesystem type.
psutil.disk_partitions()
#psutil.disk_usage('/') -details of disk usage
psutil.disk_usage('/')
```
## Network
```
import psutil
#psutil.net_io_counters() - details of network
psutil.net_io_counters()
#psutil.net_connections(kind='tcp') - list of socket connections
psutil.net_connections(kind='tcp')
#psutil.net_if_addrs() - get address of each network interface card
psutil.net_if_addrs()
```
## Other system info
```
import psutil
#psutil.boot_time() -get system boot time
psutil.boot_time()
#psutil.users() - list of users connected on system
psutil.users()
```
