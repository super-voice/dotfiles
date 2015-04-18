#!/usr/bin/env python
# 2885/7987MB 51.2% 2.11% 2.35% 2.44% <uptime> <current date>
import psutil,time,sys,os
from datetime import datetime
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

def get_battery_capacity():
    if sys.platform == 'darwin':
        return get_battery_capacity_darwin()
    power_supply = '/sys/class/power_supply'
    dirents = os.listdir('/sys/class/power_supply')
    capacity = '-1'
    ac_online = False
    for dirent in dirents:
        dirent_path = os.path.join(power_supply, dirent)
        online_path = os.path.join(dirent_path, 'online')
        if os.path.exists(online_path):
            with open(online_path, 'r') as online_file:
                online_status = online_file.read().strip()
                if online_status == '1':
                    ac_online = True
        capacity_path = os.path.join(dirent_path, 'capacity')
        if os.path.exists(capacity_path):
            with open(capacity_path, 'r') as capacity_file:
                capacity = capacity_file.read().strip()

    if ac_online:
        return 'Power Connected'
    else:
        return 'Capacity %s%%' % capacity

def get_battery_capacity_darwin():
    return 'Capacity N/A'

if __name__ == '__main__':
    if len(sys.argv) != 2:
        1#nothing
    elif sys.argv[1] == 'vm':
        # print memory usage
        vm = psutil.virtual_memory()
        stdout.write('%.1f/%.1fM' % (vm.used/1024/1024, vm.total/1024/1024))
    elif sys.argv[1] == 'cpu':
        # print cpu usage
        cpus_usage = psutil.cpu_percent(interval=0.10, percpu=True)
        for cpu_usage in cpus_usage:
            stdout.write('%6.1f%%' % cpu_usage)
    elif sys.argv[1] == 'battery':
        stdout.write(get_battery_capacity())
    elif sys.argv[1] == 'uptime':
        # print uptime
        uptime = datetime.fromtimestamp(time.time()) - datetime.fromtimestamp(psutil.boot_time())
        stdout.write(humanize_timedelta(uptime))
