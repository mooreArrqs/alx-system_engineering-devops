0x19. Postmortem

Postmortem: Nginx Web Server Underperformance

* Issue summary

>> Duration of the outage:
June 11, 2024,07:00 SAT - June 11, 2024,10:00 SAT

>> Impact:
There were a number of failed requests and the web application was down. The user experience got affected immensely as almost 62% of the users were  affected.

>> Root cause:
The root cause was the insufficient configuration of the Nginx server to handle increased load, compounded by a lack of adequate resource monitoring and scaling strategies.

* Timeline

. 07:00 SAT - The monitoring tool detected that there was an increase in error rates and a slow response times.
. 07:10 SAT - The on-call software engineer began investigating the web server.
. 07:18 SAT - The initial assumption was that the issue was due to backend service failure. Back end services were then checked and found to be operating perfectly.
. 07:27 SAT - Ongoing investigation for Nginx web server.
. 07:35 SAT - Contacted the network team to assist with diagnostics.
. 08:00 SAT -  Discovered that Nginx was not properly configured to handle the current load due to insufficient worker processes and connections settings.
. 08:35 SAT - After investigating Nginx web server adjustments were made to increase the worker processes and connections.
. 08:55 SAT - Applied configuration changes and restarted the Nginx service.
. 09:17 SAT - When the system restart after changes were implemented, there was a significant drop in error rates and improvement in response times.
. 09:58 SAT - Incident resolved, normal operation restored.

* Root Cause and Resolution

>> Root cause:
The Nginx web server was identified to be underperforming due to the default settings which were inadequate to handle the sudden increase in traffic.Pointing out that maximum connections per worker were set too low, causing the server to become overwhelmed and unable to handle incoming requests efficiently.

>> Resolution:
To resolve the Nginx web server, the server was set to match the load requirements by:

. Increasing the maximum number of connections per worker process.
. implemented more monitoring systems to detect load issues proactively.
. Restarted the Nginx service to apply the new configuration settings.

* Corrective and Preventative Measures

>> Improvements/Fixes:
. Enhance the server configuration review process.
. Implement auto-scaling strategies to handle variable load.
. Improve monitoring for better load prediction and anomaly detection.

>> List of Tasks:

1. Nginx server: Ensure the server is running to the latest version.
2. Configuration Review: Implement a peer-review process for any changes to the server configuration.
3. Monitoring systems: Ensure monitors are in place to detect any issues and set up alerts to report if an issue arise.
4. Solution: Investigate and implement possible solutions to cater for load requirements.
5. Training: Train software engineers to be better equipped with the necessary skills to handle Nginx configurations.
6. Documentation: Update internal documentation with the new configuration settings and best practices for load management.
