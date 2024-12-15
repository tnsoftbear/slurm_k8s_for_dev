### Resources and Probes

Создаем deployment с ресурсами и пробами

```bash
cd ~/slurm/practice/5.network-abstractions/1.probes/
kubectl apply -f deployment-with-stuff.yaml
```

Смотрим что получилось

```bash
kubectl get pod
```

Должны увидеть что-то типа такого:

```bash
NAME                             READY   STATUS    RESTARTS   AGE
my-deployment-69695544f6-v97jr   1/1     Running   0          20s
my-deployment-69695544f6-xcpq9   1/1     Running   0          20s
```

Поменяем специально Readiness Probe на заведомо неверную в манифесте и применим его снова

```bash
vim deployment-with-stuff.yaml
kubectl apply -f deployment-with-stuff.yaml
```

Смотрим что получилось

```bash
kubectl get pod
```

Видим что pod'ы не переходят в статус `1/1 Running`. Смотрим describe pod'а:
```bash
kubectl describe po my-deployment-<TAB>
```
Чистим за собой кластер
```bash
kubectl delete deployment --all
```
