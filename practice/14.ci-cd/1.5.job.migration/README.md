# Добавляем pre-install hook с миграцией БД

## 1. Копируем манифест deployment и job.migrate

```
cd ~/slurm/practice/14.ci-cd/1.5.job.migration/
cp job.migrate.yaml ~/xpaste/.helm/templates/
cp deployment.yaml ~/xpaste/.helm/templates/
```

## 2. Пушим, ждем запуска, рассматриваем

```
cd ~/xpaste
git add .helm/templates/job.migrate.yaml
git add .helm/templates/deployment.yaml
git commit -m "Add migrate job"
git push
```
