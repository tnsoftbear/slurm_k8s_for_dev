# Устанавливаем Базу Данных

## 1. Установка PostgreSQL

Postgres мы устанавливаем в kubernetes кластер, делается это исключительно в учебных целях. Для установки будет использована утилита helm. Для установки необходимо выполнить следующую команду:

```bash
helm install postgresql postgresql --namespace s074373-xpaste-production --atomic --timeout 120s --create-namespace
```

Postrgesql будет установлен с логином и паролем, указанными в values.yaml чарта.
Без использования Persistance Volume
