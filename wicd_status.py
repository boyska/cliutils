import dbus

def get_wicd_status():
    bus = dbus.SystemBus()
    proxy = bus.get_object('org.wicd.daemon', '/org/wicd/daemon')
    resp = tuple(proxy.GetConnectionStatus())
    state = resp[0]
    info = resp[1]
    if state == 0:
        return 'Not connected'
    elif state == 1:
        if info[0] == 'wired':
            return 'Connecting to wired...'
        else:
            return 'Connecting to %s' % info[1]
    elif state == 2:
        return 'Connected to %s, %s%% (%s)' % (info[1], info[2], info[0])
    elif state == 3:
        return 'Connected wired (%s)' % info[0]

if __name__ == '__main__':
    print get_wicd_status()

