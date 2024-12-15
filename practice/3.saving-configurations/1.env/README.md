# Environment

1) Применим манифесты для создания configmap и запуск deployment

Для этого выполним команду:

```bash
cd ~/slurm/practice/3.saving-configurations/1.env/
kubectl apply -f deployment-with-env.yaml
```

2) Проверяем результат

Для этого выполним команду, подставив вместо < RANDOM > нужное значение(`автоподстановка по TAB`):

```bash
kubectl describe pod my-deployment-< RANDOM >
```

Результат должен содержать:

```bash
Environment:
      TEST:    foo
```

3) Создаем configmap

```bash
kubectl apply -f configmap.yaml
kubectl apply -f deployment-with-env-cm.yaml
```

4) Проверяем результат

Для этого выполним команду, подставив вместо < RANDOM > нужное значение(`автоподстановка по TAB`):

```bash
kubectl exec -it my-deployment-< RANDOM > -- env
```

Результат должен содержать:

```bash
TEST=foo
dbhost=postgresql
DEBUG=false
```
