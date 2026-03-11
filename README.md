# Containerized timetree-exporter and friends

Executing the timetree-exporter in a containerized environment.
I use this to get the events from TimeTree and integrate it into my NextCloud calendar.

# Features

* Containerized timetree-exporter which exports events from TimeTree to ical format.
* Compose stack with cron and nginx to serve the exported calendar for reading by calendar clients.

## Usage

1. Copy the `docker-compose.yaml` file to your desired location.
2. Edit the `docker-compose.yaml` file to set your TimeTree credentials and calendar ID.
3. Run `podman compose up -d` to start the stack (or use you container engine).
4. Access the exported calendar at `http://localhost:8080/timetree_export.ical`. (The calendar file will be updated every 3 hours.)

### Custom calender file update interval

To change the update interval of the calendar file (defaults to every hour), the crontab file of the timetree-exporter container can be edited.

1. Map the `crontab` file to the container by adding a volume to the `timetree-exporter` service in the `docker-compose.yaml` file:
    ```yaml
    services:
      timetree-exporter:
        ...
        volumes:
          - ./crontab:/etc/crontab
    ```
2. Edit the `crontab` file to set your desired update interval. For example, to update the calendar every hour, you can use the following cron expression:
   ```
   # execute the exporter every hour
   0 0 * * * * *     /usr/local/bin/execute-exporter.sh

   # execute the exporter every 10 seconds (for testing purposes)
   */10 * * * * * *    /usr/local/bin/execute-exporter.sh
    ```
3. Restart the stack to apply the changes
