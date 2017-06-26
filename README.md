# cloudera-altuscli
Dockerfile for [Cloudera Altus CLI][1]

## Usage
Just for the first time, you need the following setup. You can get "Altus Access Key ID" and "Altus Private Key" from Altus Console (see [Altus Documentation][2] for the details)
```
$ docker pull kirasoa/cloudera-altuscli
$ docker run -ti -p 1080:1080 -v ~/.altus:/root/.altus kirasoa/cloudera-altuscli
~ # altus configure
Altus Access Key ID [****************647c]:
Altus Private Key [****************----]:
```
After this you can execute any altus command as follows
```
~ # altus --version
1.1.0

### get user info
~ # altus iam get-user

### get cluster info
~ # altus dataeng describe-clusters --cluster-name tsuyo-spark2-wa

### submit a spark job
~ # altus dataeng submit-jobs --cluster-name tsuyo-spark2-wa --jobs name="Pi Spark Job",sparkJob='{jars=[local:///opt/cloudera/parcels/CDH/lib/spark/lib/spark-examples.jar], mainClass=org.apache.spark.examples.SparkPi,sparkArguments="--num-executors 2 --executor-memory 1G"}'  

### setup a proxy to connect Cloudera Manager (you can access CM via the proxy after this command)
~ # altus dataeng socks-proxy --cluster-name "tsuyo-spark2-wa" --ssh-private-key="<your_pemfile_path>"
```

## How to build (Optional)
You can skip this if you just want to use altus cli ("docker pull" above does everything for you). If you'd like to build a Docker image by yourself, here is what you need (it may take several minutes depending on your environment).
```
$ git clone https://github.com/tsuyo/cloudera-altuscli
$ cd cloudera-altuscli
$ docker build -t cloudera-altuscli . # may take a while
```

[1]: https://www.cloudera.com/altus
[2]: https://www.cloudera.com/documentation/altus.html
