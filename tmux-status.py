#!/usr/bin/env python
# 2885/7987MB 51.2% 2.11% 2.35% 2.44% <uptime> <current date>
import psutil,time,sys
from datetime import datetime,timedelta
from sys import stdout

def humanize_timedelta(delta):
    ret = ''
    if delta.days != 0:
        ret += ' %d days' % delta.days
    hours = delta.seconds / 3600
    if hours != 0:
        ret += ' %d hours' % hours
    minutes = (delta.seconds % 3600) / 60
    ret += ' %d minutes' % minutes
    return ret

if __name__ == '__main__':
    if len(sys.argv) != 2:
        1#nothing
    elif sys.argv[1] == 'vm':
        # print memory usage
        vm = psutil.virtual_memory()
        stdout.write('%.1f/%.1fM' % (vm.used/1024/1024, vm.total/1024/1024))
    elif sys.argv[1] == 'cpu':
        # print cpu usage
        stdout.write('%.2f%%' % psutil.cpu_percent())
    elif sys.argv[1] == 'uptime':
        # print uptime
        uptime = datetime.fromtimestamp(time.time()) - datetime.fromtimestamp(psutil.boot_time())
        stdout.write(humanize_timedelta(uptime))
