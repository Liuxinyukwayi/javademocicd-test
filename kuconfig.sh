#!/bin/bash
# 导出 kubeconfig，确保里面嵌入证书，而不是文件路径
kubectl config view --raw --minify --flatten > kubeconfig.yaml

# 转成单行 base64，方便粘贴到 GitLab CI/CD Variable
KUBE_CONFIG_BASE64=$(cat kubeconfig.yaml | base64 -w0)

echo "✅ 已生成 kube_config 值，请复制以下内容添加到 GitLab → Settings → CI/CD → Variables:"
echo
echo "$KUBE_CONFIG_BASE64"

