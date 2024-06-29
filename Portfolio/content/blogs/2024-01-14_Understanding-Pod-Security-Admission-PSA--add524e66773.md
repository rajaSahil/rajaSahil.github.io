---
title: "Understanding Pod Security Admission(PSA)"
date: 2024-01-14T23:15:00+07:00
slug: psa
category: Pod Security Admission
summary:  This is a beginner’s guide for understanding PSA and it will provide a brief overview of PSA.
description: This is a beginner’s guide for understanding PSA and it will provide a brief overview of PSA.
cover:
  image:
  alt: 
  caption: 
  relative: false
  hidden: true
showtoc: false
draft: false
ShowRssButtonInSectionTermList: false

---

# Understanding Pod Security Admission(PSA)

This is a beginner’s guide for understanding PSA and it will provide a brief overview of PSA.

![](https://cdn-images-1.medium.com/max/800/1*8aoN6Bb2pWSsmmOZsz8WPg.png)

This is a beginner’s guide for understanding PSA and it will provide a brief overview of PSA.

> WAIT A MIN !!! What is PSA, I heard about PSP, what the heck is PSA?


> Before going into PSP or PSA, let me give a brief overview of k8s security, and why it is required?

### Understanding Kubernetes Security

**Kubernetes(k8s)** is a powerful and popular open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.

As organisations increasingly embrace Kubernetes for deploying and managing containerized applications, ensuring the security of these clusters becomes a paramount concern. Let’s explore few of the key aspects of k8s security:

*   Authentication and Authorization
*   Network Security
*   **Container Security**
*   Secrets Management
*   Image Security
*   **Audit logging and Monitoring**
*   Pod Isolation and Resource Quotas
*   Disaster Recovery and Backup

I will briefly cover about **Container Security** and **Audit logging/Monitoring** which is going to be used in this document.

#### Container Security

*   Security Policies for pods, restricting the capabilities and permissions of containers within pods. This ensures that pod comply to **predefined pod security standards**.
*   Administrators can set security contexts at both the pod and container levels, which can control aspects such as user **privileges**, **capabilities** and **SELinux** options.

#### Audit logging/Monitoring

*   **Audit logging** in k8s can be enabled which captures events and actions within the cluster. **Monitoring** these logs helps to detect suspicious activities and provides insights into potential security incidents.

### Pod Security Policies(PSP) \[Deprecated as of Kubernetes v1.21\]

Pod Security Policies(PSP) were a feature which has been available from the early days of Kubernetes and was designed to block misconfigured pods from being created on a given cluster. PSP had several limitations and challenges:

#### Complexity and Rigidity

*   Policies were often static and inflexible, making it challenging to adapt to dynamic application requirements.
*   Lack of support for other resource types and a limited list of controls that don’t cover some container runtime-specific parameters.

#### Maintenance Overhead

*   Keeping PSP policies up to date and aligned with changing security best practices required significant maintenance efforts.

There are several other factors behind deprecating PSPs, please refer this [document](https://github.com/kubernetes/enhancements/tree/master/keps/sig-auth/2579-psp-replacement#motivation) for detail explanation.

> Replace PodSecurityPolicy with a new built-in admission controller that enforces the [Pod Security Standards](https://kubernetes.io/docs/concepts/security/pod-security-standards/).

> Now, without further ado let’s dive into Pod Security Admission

### Pod Security Admission(PSA)

_Kubernetes offers a built-in Pod Security admission controller to enforce the Pod Security Standards. Pod security restrictions are applied at the namespace level when pods are created._

**Pod Security Admission** relies on both **Pod Security Standards** which defines the different security policies and **Pod Admission Modes** that define how the security standards are applied for a given namespace.

#### Pod Security Standards

These are the standards defined which are getting implemented by PSA. And these stands can be updated with every Kubernetes release to include/adapt new security rules.

There are three PSS defined as of now: (Follow this [link](https://kubernetes.io/docs/concepts/security/pod-security-standards/) to read more)

![](https://cdn-images-1.medium.com/max/800/1*AxUXU7yAKnizJtc2Wcw1Zw.png)

#### Pod Admission Modes

The cluster admin/namespace admin can configure an admission mode that will be used to do admission validations against workloads being deployed in the namespace. There are three admission modes that can be configured for a namespace:

*   **enforce**: Policy violations will cause the pod to be rejected.
*   **audit**: Policy violations will be logged in the audit log, won’t be rejected.
*   **warn**: Policy violations will cause a user-facing warning, won’t be rejected.

> A namespace can configure any or all modes, or even set a different level for different modes.

### Hands-On

#### Pre-requisites

*   K8s cluster v1.22 with –feature-gates=”PodSecurity=true” flag enabled or version greater than v1.25
*   kubectl command cli tool

#### Step 1: Start kubernetes

> Note: Enable audit logging for minikube

```bash
minikube stop  
  
mkdir -p ~/.minikube/files/etc/ssl/certs  
  
cat <<EOF > ~/.minikube/files/etc/ssl/certs/audit-policy.yaml  
\# Log all requests at the Metadata level.  
apiVersion: audit.k8s.io/v1  
kind: Policy  
rules:  
\- level: Metadata  
EOF  
  
minikube start \\  
  --extra-config=apiserver.audit-policy-file=/etc/ssl/certs/audit-policy.yaml \\  
  --extra-config=apiserver.audit-log-path=-
```

![](https://cdn-images-1.medium.com/max/800/1*bUTiBntT-P4Ak7S3IbT7lw.png)

#### Step 2: Enforce Pod Security Admission

As mentioned above, there are three modes through which we can configure the policies.

Policies can be applied in two different ways either via namespace labels or through an `AdmissionConfiguration` resource. For granularity over namespace selection, we can use namespace labels whereas using `AdmissionConfiguration` can allow to apply policies with respect to whole cluster.

#### Applying policies over namespace

```bash
\# The per-mode level label indicates which policy level to apply for the mode.  
#  
\# MODE must be one of \`enforce\`, \`audit\`, or \`warn\`.  
\# LEVEL must be one of \`privileged\`, \`baseline\`, or \`restricted\`.  
pod-security.kubernetes.io/<MODE>: <LEVEL>  
  
\# Optional: per-mode version label that can be used to pin the policy to the  
\# version that shipped with a given Kubernetes minor version (for example v1.29).  
#  
\# MODE must be one of \`enforce\`, \`audit\`, or \`warn\`.  
\# VERSION must be a valid Kubernetes minor version, or \`latest\`.  
pod-security.kubernetes.io/<MODE>-version: <VERSION> \[OPTIONAL\]

Kubectl create ns test-psa
```

![](https://cdn-images-1.medium.com/max/800/1*fylVyHIHofIN-ZmfcitPTw.png)

```bash
kubectl label --overwrite ns test-psa \\  
  pod-security.kubernetes.io/audit=baseline \\  
  pod-security.kubernetes.io/audit-version=latest \\  
  pod-security.kubernetes.io/enforce=baseline \\  
  pod-security.kubernetes.io/enforce-version=latest \\  
  pod-security.kubernetes.io/warn=baseline \\  
  pod-security.kubernetes.io/warn-version=latest 
```

![](https://cdn-images-1.medium.com/max/800/1*LPphyd9ypNrJk5eIpHZYow.png)

> These standards will allow the **_test-psa_** namespace to **enforce baseline standards** i.e block the future pods and will send a **warning to the user** if any pod tries to run in case of not meeting the configured policy. It will also generate a audit logs for violations which can be used for monitoring.

> **NOTE: We can also apply policy in the dry-run mode which can warn us about the violations as per the configured policies for all the namespace without enforcing the policy.**

#### Demonstrate (Deploy Pods)

To demonstrate the behaviour for the applied configuration, lets create a pod that **_violates the baseline standards as defined in the security standards_.**
```bash
cat <<EOF | kubectl -n test-psa apply -f -  
apiVersion: v1  
kind: Pod  
metadata:  
  name: nginx  
spec:  
  containers:  
  - name: nginx  
    image: nginx  
    ports:  
      - containerPort: 80  
    securityContext:  
      privileged: true  
EOF  
  
\>  
Error from server (Forbidden): error when creating "STDIN":   
pods "nginx" is forbidden: violates PodSecurity "baseline:latest": privileged   
(container "nginx" must not set securityContext.privileged=true)
```

> Error from server (Forbidden): error when creating “STDIN”: pods “nginx” is forbidden: violates PodSecurity “baseline:latest”: privileged (container “nginx” must not set securityContext.privileged=true)

In the above output, we can see that we receive a **warning** as the Pod violates the **baseline** policy and lists how to remediate_._ The Pod violates the **baseline** policy which is being **enforced** and hence is not created.

![](https://cdn-images-1.medium.com/max/800/1*S3q0gcZskbvswgZ1VRpFQg.png)

#### Audit Logs

If audit logging is enabled for kubernetes cluster, we can see an audit message for **baseline** policy violations as configured by the namespace labels.

```json
{  
  "kind": "Event",  
  "apiVersion": "audit.k8s.io/v1",  
  "level": "Metadata",  
  "auditID": "a402da4f-0cd8-4a68-9826-e693e2fdae0a",  
  "stage": "ResponseComplete",  
  "requestURI": "/api/v1/namespaces/test-psa/pods?fieldManager=kubectl-client-side-apply&fieldValidation=Strict",  
  "verb": "create",  
  "user": {  
    "username": "minikube-user",  
    "groups": \[  
      "system:masters",  
      "system:authenticated"  
    \]  
  },  
  "sourceIPs": \[  
    "192.168.49.1"  
  \],  
  "userAgent": "kubectl/v1.28.2 (darwin/arm64) kubernetes/89a4ea3",  
  "objectRef": {  
    "resource": "pods",  
    "namespace": "test-psa",  
    "name": "nginx",  
    "apiVersion": "v1"  
  },  
  "responseStatus": {  
    "metadata": {},  
    "status": "Failure",  
    "message": "pods \\"nginx\\" is forbidden: violates PodSecurity \\"baseline:latest\\": privileged (container \\"nginx\\" must not set securityContext.privileged=true)",  
    "reason": "Forbidden",  
    "details": {  
      "name": "nginx",  
      "kind": "pods"  
    },  
    "code": 403  
  },  
  "requestReceivedTimestamp": "2024-01-14T16:09:34.494473Z",  
  "stageTimestamp": "2024-01-14T16:09:34.496522Z",  
  "annotations": {  
    "authorization.k8s.io/decision": "allow",  
    "authorization.k8s.io/reason": "",  
    "pod-security.kubernetes.io/audit-violations": "would violate PodSecurity \\"baseline:latest\\": privileged (container \\"nginx\\" must not set securityContext.privileged=true)",  
    "pod-security.kubernetes.io/enforce-policy": "baseline:latest"  
  }  
}
```

![](https://cdn-images-1.medium.com/max/800/1*zidDWlAWQ0wq8cJsgo8_8Q.png)

### Conclusion

With this, we briefly discussed about Pod Security Admission (PSA) in Kubernetes. By demonstrating a simple scenario, we demonstrated how to easily configure the pod security admission for the pods running in different namespaces.

### Thanks for Reading!

I hope that you found this article to be helpful. Attaching few of the resources from where I reference for writing this article.

[**Pod Security Admission**](https://kubernetes.io/docs/concepts/security/pod-security-admission/ "https://kubernetes.io/docs/concepts/security/pod-security-admission/")[](https://kubernetes.io/docs/concepts/security/pod-security-admission/)

[**Pod Security Standards**](https://kubernetes.io/docs/concepts/security/pod-security-standards/ "https://kubernetes.io/docs/concepts/security/pod-security-standards/")[](https://kubernetes.io/docs/concepts/security/pod-security-standards/)

By [Sahil](https://medium.com/@rajasahil) on [January 14, 2024](https://medium.com/p/add524e66773).

[Canonical link](https://medium.com/@rajasahil/understanding-pod-security-admission-psa-add524e66773)

Exported from [Medium](https://rajasahil.medium.com) on June 29, 2024.