# Hostpath

1) Применяем манифест

```bash
cd ~/slurm/practice/4.saving-data/1.hostpath/
kubectl apply -f deployment.yaml
kubectl get pod
kubectl get all
kubectl describe replicaset <TAB>
```

2) Очищаем 
```bash
kubectl delete deployment my-deployment
```
