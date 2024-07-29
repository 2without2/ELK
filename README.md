# AWS секрет
#### Создаем файл секрета
```yaml

```
#### Создаем секрет
```bash
k apply -f elastic-search/aws-secret.yaml 
```
# CSI драйвер

#### Добавляем репозиторий
```bash
helm repo add aws-ebs-csi-driver https://kubernetes-sigs.github.io/aws-ebs-csi-driver
```
#### Инсталируем драйвер
```helm
helm install aws-ebs-csi-driver aws-ebs-csi-driver/aws-ebs-csi-driver
```

# ElasticSearch

#### Создаем namespace
```bash
kubectl create namespace elk
```
#### Добавляем Helm-репозиторий
```bash 
helm repo add elastic https://helm.elastic.co
helm repo update
```
#### Создаем файл elastic-search-values.yaml
```yaml

```
#### Инсталируем Elasticsearch c помошью Helm
```bash
helm install elasticsearch elastic/elasticsearch -f values.yaml --namespace elk
```
#### Получаем креды от ElasticSearch

##### Username
```bash
kubectl get secrets --namespace=elk elasticsearch-master-credentials -ojsonpath='{.data.username}' | base64 -d
```
##### Password
```bash
kubectl get secrets --namespace=elk elasticsearch-master-credentials -ojsonpath='{.data.password}' | base64 -d
```
# Kibana

#### Создаем файл kibana-values.yaml
```yaml

```
#### Инсталируем Kibana с помошью Helm
```bash
helm install kibana elastic/kibana -f kibana-valyes.yaml -n elk
```
# Logstash

#### Создаем файл elastic-search-values.yaml
```yaml

```
#### Инсталируем Logstash с помошью Helm
```bash
helm install logstash elastic/logstash -f logstash-values.yaml -n elk
```
# Filebeat

#### Создаем файл filebeat-values.yaml
```yaml

```
#### Инсталируем Filebeat с помошью Helm
```bash
helm install filebeat elastic/filebeat -f filebeat-values.yaml -n elk
```


