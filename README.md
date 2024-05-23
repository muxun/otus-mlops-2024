## HW2 - Cloud infrastructure

C помощью terraform создан бакет с3 и кластер dataproc в yc   
Terraform для двух проектов - догоживущий s3 бакет для демонстрации и короктоживущий dataproc.

### s3
Командой   `s3cmd` перенесены данные в созданный бакет  
``` s3cmd cp --recursive --acl-public s3://mlops-data/fraud-data/  s3://otus-mlops-s3/ ```  

Бакет `s3://otus-mlops-s3/`  

### dataproc 

В dataproc на hdfs перенесены данные из бакета 

`hadoop distcp s3a://otus-mlops-s3/* /user/ubuntu`


```
ubuntu@rc1a-dataproc-m-ro6b5e589g3le3t8:~$ hdfs dfs -ls /user/ubuntu
Found 40 items
-rw-r--r--   1 ubuntu hadoop 2807409271 2024-05-23 19:18 /user/ubuntu/2019-08-22.txt
-rw-r--r--   1 ubuntu hadoop 2854479008 2024-05-23 19:14 /user/ubuntu/2019-09-21.txt
-rw-r--r--   1 ubuntu hadoop 2895460543 2024-05-23 19:31 /user/ubuntu/2019-10-21.txt
-rw-r--r--   1 ubuntu hadoop 2939120942 2024-05-23 19:36 /user/ubuntu/2019-11-20.txt
-rw-r--r--   1 ubuntu hadoop 2995462277 2024-05-23 19:25 /user/ubuntu/2019-12-20.txt
-rw-r--r--   1 ubuntu hadoop 2994906767 2024-05-23 19:35 /user/ubuntu/2020-01-19.txt
-rw-r--r--   1 ubuntu hadoop 2995431240 2024-05-23 19:24 /user/ubuntu/2020-02-18.txt
-rw-r--r--   1 ubuntu hadoop 2995176166 2024-05-23 19:23 /user/ubuntu/2020-03-19.txt
-rw-r--r--   1 ubuntu hadoop 2996034632 2024-05-23 19:18 /user/ubuntu/2020-04-18.txt
-rw-r--r--   1 ubuntu hadoop 2995666965 2024-05-23 19:26 /user/ubuntu/2020-05-18.txt
-rw-r--r--   1 ubuntu hadoop 2994699401 2024-05-23 19:27 /user/ubuntu/2020-06-17.txt
-rw-r--r--   1 ubuntu hadoop 2995810010 2024-05-23 19:15 /user/ubuntu/2020-07-17.txt
-rw-r--r--   1 ubuntu hadoop 2995995152 2024-05-23 19:32 /user/ubuntu/2020-08-16.txt
-rw-r--r--   1 ubuntu hadoop 2995778382 2024-05-23 19:33 /user/ubuntu/2020-09-15.txt
-rw-r--r--   1 ubuntu hadoop 2995868596 2024-05-23 19:23 /user/ubuntu/2020-10-15.txt
-rw-r--r--   1 ubuntu hadoop 2995467533 2024-05-23 19:33 /user/ubuntu/2020-11-14.txt
-rw-r--r--   1 ubuntu hadoop 2994761624 2024-05-23 19:16 /user/ubuntu/2020-12-14.txt
-rw-r--r--   1 ubuntu hadoop 2995390576 2024-05-23 19:20 /user/ubuntu/2021-01-13.txt
-rw-r--r--   1 ubuntu hadoop 2995780517 2024-05-23 19:29 /user/ubuntu/2021-02-12.txt
-rw-r--r--   1 ubuntu hadoop 2995191659 2024-05-23 19:20 /user/ubuntu/2021-03-14.txt
-rw-r--r--   1 ubuntu hadoop 2995446495 2024-05-23 19:13 /user/ubuntu/2021-04-13.txt
-rw-r--r--   1 ubuntu hadoop 3029170975 2024-05-23 19:29 /user/ubuntu/2021-05-13.txt
-rw-r--r--   1 ubuntu hadoop 3042691991 2024-05-23 19:30 /user/ubuntu/2021-06-12.txt
-rw-r--r--   1 ubuntu hadoop 3041980335 2024-05-23 19:24 /user/ubuntu/2021-07-12.txt
-rw-r--r--   1 ubuntu hadoop 3042662187 2024-05-23 19:19 /user/ubuntu/2021-08-11.txt
-rw-r--r--   1 ubuntu hadoop 3042455173 2024-05-23 19:16 /user/ubuntu/2021-09-10.txt
-rw-r--r--   1 ubuntu hadoop 3042424238 2024-05-23 19:22 /user/ubuntu/2021-10-10.txt
-rw-r--r--   1 ubuntu hadoop 3042358698 2024-05-23 19:30 /user/ubuntu/2021-11-09.txt
-rw-r--r--   1 ubuntu hadoop 3042923985 2024-05-23 19:28 /user/ubuntu/2021-12-09.txt
-rw-r--r--   1 ubuntu hadoop 3042868087 2024-05-23 19:14 /user/ubuntu/2022-01-08.txt
-rw-r--r--   1 ubuntu hadoop 3043148790 2024-05-23 19:31 /user/ubuntu/2022-02-07.txt
-rw-r--r--   1 ubuntu hadoop 3042312191 2024-05-23 19:13 /user/ubuntu/2022-03-09.txt
-rw-r--r--   1 ubuntu hadoop 3041973966 2024-05-23 19:34 /user/ubuntu/2022-04-08.txt
-rw-r--r--   1 ubuntu hadoop 3073760161 2024-05-23 19:27 /user/ubuntu/2022-05-08.txt
-rw-r--r--   1 ubuntu hadoop 3089378246 2024-05-23 19:22 /user/ubuntu/2022-06-07.txt
-rw-r--r--   1 ubuntu hadoop 3089589719 2024-05-23 19:19 /user/ubuntu/2022-07-07.txt
-rw-r--r--   1 ubuntu hadoop 3090000257 2024-05-23 19:26 /user/ubuntu/2022-08-06.txt
-rw-r--r--   1 ubuntu hadoop 3089390874 2024-05-23 19:17 /user/ubuntu/2022-09-05.txt
-rw-r--r--   1 ubuntu hadoop 3109468067 2024-05-23 19:21 /user/ubuntu/2022-10-05.txt
-rw-r--r--   1 ubuntu hadoop 3136657969 2024-05-23 19:35 /user/ubuntu/2022-11-04.txt
```