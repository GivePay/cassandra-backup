# Cassandra backup util
The Cassandra backup util is a project that allows you to take Cassandra snapshots, upload them to a blob store or folder of your choice and also restore a Cassandra node from a previously created snapshot. Cassandra backup util will also manage the jmx operation of taking the snapshot itself.

The Cassandra backup util can take full snapshots, incremental snapshots, per table and per keyspace snapshots. Token metadata is also maintained in relation to the snapshot taken, this makes restoring vnode enabled clusters simple and easy.

Cassandra backup util supports upload throttling based on throughput and expected time taken. Uploads to blob stores are done as multi-part uploads with automatic cleanup of failed uploads. 

The Cassandra backup util will also shortly support archiving commitlogs and point in time recovery.

Cassandra backup util also supports Cassandra running on Windows environments. 

## Options

```text
$ java -jar backup-0.1-final.jar
ERROR cassandra-backup: Option "-c (--cluster)" is required
Usage: cassandra-backup [keyspace ...] [-t (--tag) snapshot-tag] [--cf (--column-family) name] [--drain] [-s (--speed) [slow | fast | ludicrous | plaid]] [-d (--duration) time] [-b (--bandwidth) data-rate] [-j (--jmx) jmx-url] [--ju jmx-user] [--jp jmx-password] [--bucket (--backup-bucket) bucket_name] [--id (--backuluster) cluster ID [--dd (--data-directory) /cassandra] [--fl (--filebackup-location) /backups] [--cd (--config-directory) /cassandra] [-p (--shared-path) /]
 -t (--tag) snapshot-tag                                    : Snapshot tag name. Default is equiv. to 'autosnap-`date
                                                              +%s`'
 --cf (--column-family) name                                : The column family to snapshot/upload. Requires a keyspace
                                                              to be specified.
 --drain                                                    : Optionally drain Cassandra following snapshot.
 -s (--speed) [slow | fast | ludicrous | plaid]             : Speed to upload the com.instaclustr.backup.
 -d (--duration) time                                       : Calculate upload throughput based on total file size ÷
                                                              duration.
 -b (--bandwidth) data-rate                                 : Maximum upload throughput.
 -j (--jmx) jmx-url                                         : JMX service url for Cassandra
 --ju jmx-user                                              : JMX service user for Cassandra
 --jp jmx-password                                          : JMX service password for Cassandra
 --bucket (--backup-bucket) bucket_name                     : Container or bucket to store backups in
 --id (--backup-id) cassandra-2                             : Cassandra backup id
 --offline false                                            : Cassandra is not running (won't use JMX to snapshot, no
                                                              token lists uploaded)
 --concurrent-connections count                             : Number of files (or file parts) to upload or download
                                                              concurrently. Higher values will increase throughput.
                                                              Default is 10.
 --wait                                                     : Wait to acquire the global transfer lock (which prevents
                                                              more than one com.instaclustr.backup or restore from
                                                              running).
 --help                                                     : Show this message.
 --bs (--blob-storage) [AWS_S3 | AZURE_BLOB | GCP_BLOB |    : Blob storage provider (AWS, AZURE, GCP, FILE)
 FILE]
 -c (--cluster) cluster ID                                  : Parent cluster of node to restore from.
 --dd (--data-directory) /cassandra                         : Base directory that contains the Cassandra data, cache
                                                              and commitlog directories
 --fl (--filebackup-location) /backups                      : Base directory destination for filesystem based backups
 --cd (--config-directory) /cassandra                       : Base directory that contains the Cassandra data, cache
                                                              and commitlog directories
 -p (--shared-path) /                                       : Shared Container path for pod
```

## Use as a library
The Cassandra backup util can also be imported as a library for any JVM based project. It is currently used by the Instaclustr [cassandra operator](https://github.com/instaclustr/cassandra-operator) and within Instaclustrs [managed services](https://www.instaclustr.com). Commercial support for the backup util is available from [Instaclustr](https://www.instaclustr.com/services/cassandra-support/)

## TODO
* Documentation
* Testing for blob stores
* Commitlog archiving


Please see https://www.instaclustr.com/support/documentation/announcements/instaclustr-open-source-project-status/ for Instaclustr support status of this project
