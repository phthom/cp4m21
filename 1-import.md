# IBM Cloud Pak for Multicloud Manager Labs

# Lab #1: Import a cluster in the Hub



![image-20201008083020566](images/image-20201008083020566-2138620.png)



Philippe Thomas - September 2020



# Introduction

During this lab, we are going to manipulate some basic aspects of the **console** of IBM Cloud Pak for Multicloud Manager (CP4M for short in this document) and especially the **import** feature to get access to some managed clusters. 



# Task 1 - Access CP4M console

Be sure to use the latest **Firefox** internet browser.  

To get access the CP4M console, the instructor will give you a URL similar to the one below:

```http
https://cp-console.niceaz-ba36b2ed0b6b09dbc627b56ceec2f2a4-0000.ams03.containers.appdomain.cloud
```

The Credentials are **admin** and a password given by the instructor.  

Then you should see the following sign on page:

![image-20201008083929253](images/image-20201008083929253-2139169.png)



For this exercise, we want to get access to the **Cluster Administrator** role, so click on the Default authentication link in the page:

![image-20201008084141669](images/image-20201008084141669-2139301.png)

Then type **admin** and the  password from the instructor.

![image-20201008084539168](images/image-20201008084539168-2139539.png)

Click **Log in** and here it is : the welcome page should appear:

![image-20201008084642985](images/image-20201008084642985-2139603.png)

From this page, you can navigate to the different parts of the **documentation**: for instance, click on the Automate cloud provisioning documentation blue link:

![image-20201008085010738](images/image-20201008085010738-2139810.png)

You will get access to the documentation:

![image-20201008085215557](images/image-20201008085215557-2139935.png)

Come back to the welcome page and now look at the bottom of the page:

![image-20201008085319061](images/image-20201008085319061-2139999.png)

Here is the place where you can download the CLI tools:

![image-20201008085424169](images/image-20201008085424169-2140064.png)



You can see some of the commands that are necessary for your day to day management activity: 

![image-20201008085719931](images/image-20201008085719931-2140239.png)

The IBM Cloud Pak CLI is one of the most important command line tool that you can use to control a Cloud Pak : **cloudctl**

Open a terminal window on your laptop, ssh to your work environment and check that you have installed cloudctl:

```bash
cloudctl
```

Results:

```bash
cloudctl
NAME:
   cloudctl - A command line tool to interact with IBM Cloud Platform Common Services and IBM Cloud Private

USAGE:
[environment variables] cloudctl [global options] command [arguments...] [command options]

VERSION:
   v3.4.2-1808+e5ed7d09f67f2cc044e15edcd7a92f79bbb996e3

COMMANDS:
   api          View the API endpoint and API version for the service.
   case         [Cloud Platform Common Services only] Manage CASE.
   catalog      Manage catalog.
   cm           Manage cluster.
   completion   Generate an auto-completion script for the specified shell (bash or zsh).
   config       Write default values to the configuration.
   helm-init    Prints the configuration of the HELM_HOST setting for Helm.
   iam          Manage identities and access to resources.
   login        Log user in.
   logout       Log user out.
   metering     Download metering reports.
   plugin       Manage plugins.
   pm           Manage passwords.
   target       Set or view the targeted namespace.
   tokens       Display the OAuth tokens for the current session. Run `cloudctl login` to retrieve the tokens.
   version      Check CLI and API version compatibility.
   help         
   
Enter 'cloudctl help [command]' for more information about a command.

ENVIRONMENT VARIABLES:
   CLOUDCTL_COLOR=false                     Do not colorize output
   CLOUDCTL_HOME=path/to/dir                Path to config directory
   CLOUDCTL_TRACE=true                      Print API request diagnostics to stdout
   CLOUDCTL_TRACE=path/to/trace.log         Append API request diagnostics to a log file

GLOBAL OPTIONS:
   --help, -h                         Show help

```

This command is very usefull to control the security aspects, the catalog, the clusters, helm init variables, metering and finally password and tokens in CP4M. 

If you want to use the autocompletion, type the folloing command:

```bash
cloudctl completion bash > cloudctl_complete.sh; source cloudctl_complete.sh
```

To get access to CP4M with the cloudctl command line, type the following log in command:

```bash
cloudctl login [-a CLUSTER_URL] [-u USERNAME] [-p PASSWORD]  [-c ACCOUNT_ID or ACCOUNT_NAME] [-n namespace] [--skip-ssl-validation] 
```

For example:

```bash
cloudctl login -a cloudctl login -a cp-console.niceaz-ba36b2ed0b6b09dbc627b56ceec2f2a4-0000.ams03.containers.appdomain.cloud -u admin -p <password> -n default
```

Results:

```bash
# cloudctl login -a cloudctl login -a cp-console.niceaz-ba36b2ed0b6b09dbc627b56ceec2f2a4-0000.ams03.containers.appdomain.cloud -u admin -p W0qhzcskdjgzgfsdfC1AvS1OZ -n default 
OK

Targeted account mycluster Account

Targeted namespace default

Configuring kubectl ...
Property "clusters.mycluster" unset.
Property "users.mycluster-user" unset.
Property "contexts.mycluster-context" unset.
Cluster "mycluster" set.
User "mycluster-user" set.
Context "mycluster-context" created.
Switched to context "mycluster-context".
OK

Configuring helm: /Users/phil/.helm
OK

```

You can now display the cluster HUB status (where CP4M is running):

```bash
cloudctl cm cluster-status
```



![image-20201008091816463](images/image-20201008091816463-2141496.png)

With both the CP4M console and the cloudctl command, you are now ready to work.



# Task 2 - Navigate in the CP4M console

Go back to the console:

![image-20201008093935282](images/image-20201008093935282-2142775.png)

In the top right corner, you can see your identity and the default account. 

![image-20201008094027328](images/image-20201008094027328-2142827.png)

> You can create several accounts and several users but you need to connect to a LDAP

Then you can navigate to the exclamation mark to look at different options to help you to implement the CP4M solutions :

![image-20201008094342814](images/image-20201008094342814-2143022.png)

For example, for support, you can also use Slack.

Now you can also go to the Web Terminal if you don't have access to some CLI environment:

![image-20201008094708143](images/image-20201008094708143-2143228.png)

Click on **getting started** link:

![image-20201008094806927](images/image-20201008094806927-2143286.png)

Results:

![image-20201008094913338](images/image-20201008094913338-2143353.png)

You can directly use the following commands **without sign on**:

- cloudctl
- kubectl
- helm 
- istioctl
- oc

For example:

```bash
oc get nodes
```

Results:

![image-20201008095415547](images/image-20201008095415547-2143655.png)

Part of the magic, you can click on the resulting table to see a specific item. For instance, click on the IP address of a specific node:

![image-20201008095728833](images/image-20201008095728833-2143848.png)

On the the right part of the screen (in black), you should see some information about this node.

The second magic aspect of the back side, this is also clickable !

You can click on different tabs (raw and events in this case) and you can click inside the display.

```bash
oc get pods
```

Results

![image-20201008100258359](images/image-20201008100258359-2144178.png)

Click on Ansible Tower POD and then click on Containers tab:

![image-20201008100349447](images/image-20201008100349447-2144229.png)

Then click on some containers to look at their logs:

![image-20201008100529831](images/image-20201008100529831-2144329.png)



Let's move on the next step and look at the creation of resources in your HUB cluster:

![image-20201008100829216](images/image-20201008100829216-2144509.png)

You can just cut and past your YAML content directly in here:

![image-20201008100933225](images/image-20201008100933225-2144573.png)



Now let's go to the catalog:

![image-20201008101953073](images/image-20201008101953073-2145193.png)

Results:

![image-20201008102016349](images/image-20201008102016349-2145216.png)



In the filtering tab, you can select what you want to see:

![image-20201008102142248](images/image-20201008102142248-2145302.png)

or 

![image-20201008102249994](images/image-20201008102249994-2145370.png)

Most of the applications are **helm charts**: for example, find all the node.js applications available in the catalog:

![image-20201008102507808](images/image-20201008102507808-2145507.png)

Click on the ibm-nodes-express tile:

![image-20201008102545573](images/image-20201008102545573-2145545.png)

You can the detailled information about this helm chart and you can also configure and launch this application:

![image-20201008102731165](images/image-20201008102731165-2145651.png)

Click on configuration to see the parameters:

![image-20201008102808641](images/image-20201008102808641-2145688.png)

This application can be launched on **any cluster** that is managed by CP4M cluster HUB. 

Finally, you can navigate in the different item and capabilities on the **humberger menu** (referenced as the **MENU** later on in this document):

![image-20201008103146378](images/image-20201008103146378-2145906.png)

![image-20201008103217819](images/image-20201008103217819-2145937.png)

The one that we are going to use a lot is the **Automate Infrastructure** and the **Manage Services**:

![image-20201008103354972](images/image-20201008103354972-2146035.png)



# Task 3 - Import a new cluster

From the **menu**, Click on **Automate Infrastructure**, and the **Clusters**:

![image-20201008103953042](images/image-20201008103953042-2146393.png) 

At this point, you should have only one cluster: the **local cluster** (this is the HUB cluster):

![image-20201008104050521](images/image-20201008104050521-2146450.png)

The local cluster is the OCP cluster where you installed CP4M main features. 

Normally it should **not** be used to hold some applications : the best practice is to use remode clusters to deploy your applications. However for the purpose of this lab, we are going to deploy some applications on it. 

To import a new (remote) cluster, click on **Add Cluster button**:

![image-20201008123655964](images/image-20201008123655964-2153416.png)

 Click **Import**  and fill the name with **cluster-niceremotecluster<xx>** where **xx** is the **number assigned** to you by the instructor:

As an example:

![image-20201008123917545](images/image-20201008123917545-2153557.png)



Click on **Generate Command** button:

![image-20201008124144239](images/image-20201008124144239-2153704.png)

A curl command has been generated for you. 

Clcick on the copy button ![image-20201008124248960](images/image-20201008124248960-2153769.png)

Open a new terminal window on your laptop or on you your work environment. Login with ssh or putty to the remote cluster :

> You need the IP address and the password that will be given by the instructor

- IP address of the remote cluster master
- Password of this VM

```bash
ssh root@161.156.96.200
root@161.156.96.200's password: 
Last failed login: Thu Oct  8 06:24:21 CDT 2020 from lfbn-nic-1-189-121.w2-15.abo.wanadoo.fr on ssh:notty
There were 2 failed login attempts since the last successful login.
Last login: Thu Oct  8 06:10:07 2020 from niceremotecluster01.ibm.ws
[root@niceremotecluster01 ~]# 
```

Once you are connected, check your remote cluster is up and running:

```bash
kubectl get nodes
NAME             STATUS   ROLES                                 AGE   VERSION
161.156.96.200   Ready    etcd,management,master,proxy,worker   68m   v1.13.9+icp
```

This remote cluster is a All in One Cluster (only one VM running master and worker). 

Now paste the curl command that you got from the IMPORT process (as an example):

```bash
curl -k -H "Authorization: Bearer b18374512ef1d4402f27b9818e8c31ffdb7916bd6533abbeced1eca5974c0e234f947888c6326ff3ae5c7308b7461136a2aeb57918f9099517cbd3ab3e37dbd6edb6cd9c84cdc87fbea61566d436febfc9c036fc2eee147ac35eae9f69bc2827ea01391c1522d6733eaeee277af55e19b911f61e84113f1055f76f179d7c33717c0cb2a3e9019346f0b124bf4722d6d25a0370505dc11ade0ea1100a28ce33d1ba8fd2632fe77682c1a5f9a742f15785c0a6694e9af31468aaf14d3008892995e803d0f54bca7bad214bd2d762892242a7de279940c00334ca9b9fe08f85af481135a4f3f009cccb1ed6798a61daa6384633c82c1f3745ebe1dba2ba1beb5c0412d40619a2035c3e4935c3662b80205447a35d5f9be1af88c68370eaf04fbfd7fdc377decc263897bb2f69c7727e8d006f2576904aa5e81087d6f801d7d8fa54397823337ef6544f62c4c36bea4e94ee6d557e228f15390e7556c8f7df48bbbd6752a49a92ee658cfe998b4571176f42e76068235b691ea92dab6df79ad397f46704a14ac3007788ee945376920ba51eb6d03363f82c67be0b04522ab0889400ecbc62bffa8295c3851ce11361ede9de5ca40ab27acb80ad8d61804b053703552f8048b98ce06d3361c536a81bbca84598eadbdca318f3282c6d7cfe0c35c2cfd9b64a7edf9a6f18f0ac1db59917eb22b004ff006644241814584ae4623b2cfe" https://cp-console.niceaz-ba36b2ed0b6b09dbc627b56ceec2f2a4-0000.ams03.containers.appdomain.cloud:443/rcm/v1/clusters/cluster-niceremotecluster01/cluster-niceremotecluster01/import.yaml | kubectl apply -f -
```

Results:

```
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  5825    0  5825    0     0  14652      0 --:--:-- --:--:-- --:--:-- 14709
customresourcedefinition.apiextensions.k8s.io/endpoints.multicloud.ibm.com created
Warning: kubectl apply should be used on resource created by either kubectl create --save-config or kubectl apply
namespace/multicluster-endpoint configured
secret/klusterlet-bootstrap created
serviceaccount/ibm-multicluster-endpoint-operator created
clusterrolebinding.rbac.authorization.k8s.io/ibm-multicluster-endpoint-operator created
deployment.apps/ibm-multicluster-endpoint-operator created
endpoint.multicloud.ibm.com/endpoint created
[root@niceremotecluster01 ~]# 

```

Check carefully the result (if any error, then retry the curl command)

Check the pods with the command:

```bash
kubectl get pods -n multicluster-endpoint
```

Results after 3 minutes:

```bash
# kubectl get pods -n multicluster-endpoint
NAME                                                  READY   STATUS    RESTARTS   AGE
endpoint-appmgr-56c98d5fc8-dmvrz                      2/2     Running   0          2m
endpoint-component-operator-7766bb57bd-2xtmk          1/1     Running   0          2m39s
endpoint-connmgr-f49784c8c-9wfnx                      1/1     Running   0          2m10s
endpoint-policyctrl-bdc55d96-659d4                    2/2     Running   0          2m
endpoint-search-76c86558f-s5h2r                       1/1     Running   0          2m
endpoint-svcreg-698d8b46c4-xrmvj                      1/1     Running   0          2m
endpoint-svcreg-coredns-55987575fb-nmpcx              1/1     Running   0          2m10s
endpoint-workmgr-7649d857cb-hk7rx                     1/1     Running   0          2m
ibm-multicluster-endpoint-operator-7bbcb6dcd9-bqn6d   1/1     Running   0          3m
```

Now go back to the CP4M console and click on **Clusters**: you should see your new remote cluster in the list.

![image-20201008134245363](images/image-20201008134245363-2157365.png)

You notice that your remote cluster  is added to the list. You can add labels to identify your new cluster. On the managed-cluster row, click the three dots icon and select **Edit labels** :

![image-20201008134456693](images/image-20201008134456693-2157496.png)

Then add a new label named **environment** with a value of QA  

![image-20201008134808965](images/image-20201008134808965-2157689.png)

Then **Click +** and then **Save**.

Doublecheck the labels:

![image-20201008135040533](images/image-20201008135040533-2157840.png)



Now visualize your clusters in the **overview**:

![image-20201008135201521](images/image-20201008135201521-2157921.png)



![image-20201008135332657](images/image-20201008135332657-2158012.png)







# Task 4 - Deploy an application

Open the **Menu** (1) and click on **Administer** (2) **> Helm repository** (3).

![image-20201008135742665](images/image-20201008135742665-2158262.png)

On the Helm Repositories page, click **Add Repository** to register a new Helm Repository.

![image-20201008135915970](images/image-20201008135915970-2158356.png)

Type **coc-charts** (1) as repository Name, and enter **https://ibm-icp-coc.github.io/charts/repo/stable** as URL (2). Click **Add** (3).

![image-20201008135946574](images/image-20201008135946574-2158386.png)

After few seconds, you should see Sync Status as **Completed**. Now, let’s deploy an application from this new Helm repository. Click **Catalog** on upper right corner of the page to view the list of helm charts that you can deploy.

![image-20201008140135880](images/image-20201008140135880-2158495.png)

In the catalog, search for **sum**  and select the **sumapp**

![image-20201008140301042](images/image-20201008140301042-2158581.png)

The chart deploys a simple Liberty web application for demonstration purposes. Click **Configure** to continue.

![image-20201008140335978](images/image-20201008140335978-2158616.png)



Enter **mysum** as Helm release name (1), select **default** as Target namespace (2). On Target cluster, select both **local-cluster** and **managed-cluster** (3). Then click **Install** (4).

![image-20201008140404731](images/image-20201008140404731-2158644.png)

The installation starts immediately but it take a few minutes to deploy the application to remote cluster. Click **View Helm Releases** to view the status.

![image-20201008144311711](images/image-20201008144311711-2160991.png)

On the Helm releases page, you can check that **mysumapp** helm is deployed to your clusters.

![image-20201008144349113](images/image-20201008144349113-2161029.png)



# Task 5 - Find resources on multiple clusters

One feature that is very interesting in CP4M is the search feature (loop) on the top right part of the screen:

![image-20201009093736545](images/image-20201009093736545-2229056.png)

When you click on that feature, you see some predefined search that are very interesting for everyday:

![image-20201009093911173](images/image-20201009093911173-2229151.png) 

Especially the **workloads** first search is very popular, then **click on the tile**:

![image-20201009094024046](images/image-20201009094024046-2229224.png)

The findings are shown:

![image-20201009094130098](images/image-20201009094130098-2229290.png)

What is important to notice, the search is executed **across all clusters** ! And the answer is very quick. 

You can then select the tile related to **all pods** across all clusters :

![image-20201009094351688](images/image-20201009094351688-2229431.png)

Results:

![image-20201009094453381](images/image-20201009094453381-2229493.png)

Another feature is the filtering of different values. First go to the search zone:

![image-20201009094643873](images/image-20201009094643873-2229603.png)

Start to type name and choose namespace in the filtering list:

![image-20201009094852081](images/image-20201009094852081-2229732.png)

This should result to this (a long list of all namespaces across clusters):

![image-20201009094934813](images/image-20201009094934813-2229774.png)

Pick the default namespace in the list and continue with **kind:pod** then you sould see all the pods running on all clusters in the default namespaces: 

![image-20201009095348853](images/image-20201009095348853-2230028.png)

Now you can save your search by clicking the **blue diskette**:

![image-20201009095753198](images/image-20201009095753198-2230273.png)



# Congrats

You successfully accessed the CP4M console, you imported a new clusted that has been already created, you deployed an application across clusters, you installed the cloudctl command line, and you touched all the main features including the seach function.



Thanks.

---

