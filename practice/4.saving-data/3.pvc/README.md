# PV/PVC

1) Применяем манифест pvc.yml

```bash
cd ~/slurm/practice/4.saving-data/3.pvc
kubectl apply -f pvc.yaml

kubectl get pvc
kubectl get pv
```

2) Запустим приложение, использующее PV

```bash
kubectl apply -f .
```

3) Посмотрим describe и смонтированные тома в контейнере

```bash
kubectl describe pod fileshare-<TAB>
kubectl exec -it fileshare-<TAB> -- df -h
```

4) Очищаем

```bash
kubectl delete -f .
```
