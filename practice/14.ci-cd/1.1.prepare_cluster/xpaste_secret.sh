#!/bin/bash

NS=s<Ваш номер логина>-xpaste-production

kubectl delete secret slurm-xpaste --namespace "$NS"

kubectl create secret generic slurm-xpaste \
  --from-literal secret-key-base=xxxxxxxxxxxxxxxxxxxxxxxxx \
  --from-literal db-user='myapp' \
  --from-literal db-password='myapp' \
  --namespace "$NS"
