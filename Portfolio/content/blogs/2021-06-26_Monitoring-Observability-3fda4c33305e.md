---
title: "Monitoring/Observability"
date: 2021-06-26T23:15:00+07:00
slug: observability
category: Observability
summary:  This is a beginner’s guide for understanding Monitoring fundamentals and different components of Monitoring.
description: This is a beginner’s guide for understanding Monitoring fundamentals and different components of Monitoring.
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

# Monitoring/Observability

This is a beginner’s guide for understanding Monitoring fundamentals and different components of Monitoring.

![](https://cdn-images-1.medium.com/max/800/1*tF4OQt4nH5S40gqqMHfzbA.png)

This is a beginner’s guide for understanding Monitoring fundamentals and different components of Monitoring.

### Observability

Recently, the term **_Monitoring_** has been overtaken by a superset called  
observability, which is regarded as the evolution of monitoring. It includes all the components that we are going to discuss in this blog.

### Monitoring

> English definition: the act of observing something (and sometimes keeping a record of it)

> **Is this the exact definition of Monitoring? — If we were to ask 10 different persons related to different industries about monitoring, we would get 11 different answers.**

_So, What exactly do we mean by_ **_Monitoring_**_?_

#### Definition of Monitoring

A perfect definition of monitoring is hard to derive as it quickly shifts between industry or even job-specific contexts. The diversity of viewpoints, the components comprising the monitoring system, and even how the data is collected or used are all factors contributing to the struggle to reach a clear definition.

Therefore, in this blog, we will try to obtain a definition of monitoring for software developers and administrators in the operation of production computer systems, such as the applications, tools, databases, and networks backing popular websites.

So now that, we have narrowed down the context, we can discuss why **monitoring is required** and what are the **basic components of monitoring** for computer systems.

### Benefits of Monitoring

Nowadays, the software engineering field is moving so fast. Giga, Tera, Peta gigabytes of data are processed every day, connected devices and users are growing all around the world. Software architecture is moving towards the adoption of **microservices-oriented architecture**. And it is unthinkable to manually validate the health of each instance, caching services, database, or load balancer.

Therefore, it is expected that the **monitoring stack** will keep track of data from those components. However, data might come in several forms which can be used for different purposes.

**Alerting** is one of the standard uses of monitoring data. Getting alerts of the event when things are going wrong is usually the most important thing that you want monitoring for. You want the monitoring system to call in a human to take a look.

> Monitoring can help us to **maintain healthy systems** and also helps us to debug any components of system software due to which performance is getting affected.

### Monitoring Components

Monitoring components are the formats that can be aggregated and analyzed to understand the state of a system.

1.  **Metrics**
2.  **Logging**
3.  **Tracing**
4.  **Alerting**
5.  **Visualization**

#### Metrics

Metrics are a numerical representation of data. This exposes a certain system resource, application action, or business characteristic as a specific point in time value. This information is obtained in an aggregated form. They measure something (like CPU usage, number of errors, etc.) and are numeric in nature.

For example, you can find out how many requests per second were served but not the exact time for a specific request, and without context, you won’t know the ID of the requests.

Examples of metrics-based monitoring systems include the **Prometheus stack**.

#### Logging

Logs contain much more data than a metric. It is itself an event from a system or application, containing all the information that’s produced by such an event.

Logs contain the entire stack trace of the exception in case of errors, which allows us to view and debug issues originating from systems easily. In short, logs can tell you what happened in the system at a certain time.

Examples of logging-based monitoring systems include the **EFK stack** and **Grafana Loki.**

#### Tracing

Tracing is a special case of logging where a request is given a unique identifier so that it can be tracked during its entire life cycle across every system. Traces add critical visibility into the health of an application end-to-end. They are, however, solely focused on the application layer and provide limited visibility into the health of the underlying infrastructure.

A trace represents a single user’s journey through an entire stack of an application. It is often used for optimization purposes. For example, you would use it to establish little used part of a stack or bottlenecks within specific parts of the stack.

Examples of tracing systems include **Jaeger and Zipkin.**

#### Alerting

Alerting is the responsive component of a monitoring system that performs actions based on changes in metric or log values. Alerts are mainly composed of two components: a condition or threshold for metrics or logs, and an action to perform when the values fall outside of the acceptable conditions.

#### Visualization

Graphical representation of metrics, logs, or traces.

> To summarize the definition of **monitoring**

> **Monitoring** is the process of collecting, aggregating, and analyzing the events to improve awareness of the components’ characteristics and behaviour. The data from various components of the software are collected into a **monitoring system** that is responsible for storage, aggregation, visualization, and initiating automated responses when the values meet specific requirements.

With this, we briefly discussed some of the concepts that are required to understand **Monitoring**. There are different monitoring stack available that is implemented using metrics, logging or tracing systems. Examples of such stacks include **Prometheus stack**, **EFK stack,** and many more.

### Thanks for Reading!

I hope that you found this article to be helpful. I will be posting more articles on **Monitoring Stack**.

By [Sahil](https://medium.com/@rajasahil) on [June 26, 2021](https://medium.com/p/3fda4c33305e).

[Canonical link](https://medium.com/@rajasahil/monitoring-observability-3fda4c33305e)

Exported from [Medium](https://rajasahil.medium.com) on June 29, 2024.