# Nominatim Docker image

Forked from https://github.com/mediagis/nominatim-docker/tree/master/2.5

100% working container for [Nominatim](https://github.com/twain47/Nominatim).

Run [http://wiki.openstreetmap.org/wiki/Nominatim](http://wiki.openstreetmap.org/wiki/Nominatim) in a docker container. Clones the current master and builds it. This is always the latest version, be cautious as it may be unstable.

Uses Ubuntu 14.04 and PostgreSQL 9.3

# Country
To check that everything is set up correctly, download and load to Postgres PBF file with minimal size - Europe/Italy (latest) from geofabrik.de.

If a different country should be used you can set `PBF_DATA` on build.

1. Clone repository

  ```
  # git clone https://github.com/ddmng/nominatim-local-server.git
  # cd nominatim-local-server/1.0
  ```

2. Modify Dockerfile, set your url for PBF

  ```
  ENV PBF_DATA http://download.geofabrik.de/europe/italy-latest.osm.pbf
  ```
3. Configure incremental update (NOT TESTED). By default CONST_Replication_Url configured for Italy.
If you want a different update source, you will need to declare `CONST_Replication_Url` in local.php. Documentation [here] (https://github.com/twain47/Nominatim/blob/master/docs/Import_and_update.md#updates). For example, to use the daily country extracts diffs for Gemany from geofabrik add the following:
  ```
  @define('CONST_Replication_Url', 'http://download.geofabrik.de/europe/germany-updates');
  ```

4. Build

  ```
  make build-base
  make build-andorra
  ```
5. Run

  ```
  make run-andorra
  ```
  If this succeeds, open [http://localhost:8080/](http:/localhost:8080) in a web browser

# Update

Full documentation for Nominatim update available [here](https://github.com/twain47/Nominatim/blob/master/docs/Import_and_update.md#updates). For a list of other methods see the output of:
  ```
  docker exec -it nominatim-local-server sudo -u nominatim ./src/utils/update.php --help
  ```

The following command will keep your database constantly up to date:
  ```
  docker exec -it nominatim-local-server sudo -u nominatim ./src/utils/update.php --import-osmosis-all --no-npi
  ```
If you have imported multiple country extracts and want to keep them
up-to-date, have a look at the script in
[issue #60](https://github.com/twain47/Nominatim/issues/60).
