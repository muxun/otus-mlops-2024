## HW2 - Cloud infrastructure

C помощью terraform создан бакет с3 и кластер dataproc в yc   
Terraform для двух проектов - догоживущий s3 бакет для демонстрации и короктоживущий dataproc.

### s3
Командой   `s3cmd` перенесены данные в созданный бакет  
``` s3cmd cp --recursive --acl-public s3://mlops-data/fraud-data/  s3://otus-mlops-s3/ ```  

Бакет `s3://otus-mlops-s3/`  

### dataproc 

В dataproc на hdfs перенесены данные из бакета 

```

```