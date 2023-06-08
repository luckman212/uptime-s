#include <stdio.h>
#include <time.h>
#include <errno.h>
#include <sys/sysctl.h>

double uptime()
{
    struct timeval boottime;
    size_t len = sizeof(boottime);
    int mib[2] = { CTL_KERN, KERN_BOOTTIME };
    if( sysctl(mib, 2, &boottime, &len, NULL, 0) < 0 )
    {
        return -1.0;
    }
    time_t bsec = boottime.tv_sec, csec = time(NULL);

    return difftime(csec, bsec);
}

int main() {
    double systemUptime = uptime();
    if (systemUptime >= 0.0) {
        printf("%.0f\n", systemUptime);
    } else {
        printf("Failed to retrieve system uptime.\n");
    }

    return 0;
}
