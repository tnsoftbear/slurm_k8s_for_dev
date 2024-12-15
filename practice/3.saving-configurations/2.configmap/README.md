# Configmap

1) Создаем configmap

Для этого выполним команды:

```bash
cd ~/slurm/practice/3.saving-configurations/2.configmap/
kubectl apply -f configmap.yaml
kubectl apply -f deployment-with-configmap.yaml
```

2) Проверяем

Проверим, что configmap попал в контейнер, для этого пробросим порт из пода и выполним curl.
Для этого выполним команду, заменив имя pod на имя вашего pod(``можно воспользоваться автоподстановкой по TAB``).

& - это запуск команд в фоновом режиме, потом вводим следующую команду. 
```bash
kubectl port-forward my-deployment-<TAB> 8080:80 &
curl 127.0.0.1:8080
```

В результате выполнения curl увидим имя пода, который обработал запрос. Результат должен быть примерно таким:

```bash
my-deployment-5b47d48b58-l4t67
```

3) Обновим configmap

```bash
kubectl edit configmap my-configmap

# изменим текст ответа

            return 200 '$hostname\nOK\n';
```

4) Проверим вывод пода

```bash
curl 127.0.0.1:8080
```

Вывод не изменился

5) Монтирование configmap, как отдельного файла в каталоге через subPath

Применяем манифесты:

```bash
kubectl apply -f php-config.yaml
kubectl apply -f deployment-with-configmap-php.yaml
```

6) Заходим в под, смотрим на смонтированный файл

```bash
kubectl exec -it my-deployment-<TAB> -- bash

ls -lsa /etc
```

7) Смотрим, что бывает, если попробовать смонтировать файл в существующий каталог.

Исправляем манифест деплоймент, в части точки монтирования configmap my-php-conf
Убираем subPath, меняем точку монтирования.

```bash
kubectl edit deployment my-deployment
```

```yaml
  - mountPath: /etc
    name: php
```

8) Смотрим причину, по которой не стартует под

```bash
kubectl describe pod my-deployment-<TAB>
```

9) Чистим за собой, удаляем "изломанный" deployment

```bash
kubectl delete deployment my-deployment
```
