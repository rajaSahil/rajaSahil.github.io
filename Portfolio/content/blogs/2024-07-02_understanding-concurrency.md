---
title: "Concurrency building blocks"
date: 2024-06-02T23:15:00+07:00
slug: concurrency
category: Concurrency
summary:  This is a beginner’s guide for understanding Concurrency, and it will provide a brief concepts required to understand Concurrency.
description: This is a beginner’s guide for understanding Concurrency, and it will provide a brief concepts required to understand Concurrency.
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

#  01. Concurrency Building Blocks

This is a beginner’s guide for understanding Concurrency, and it will provide a brief concepts required to understand _Concurrency_.

> Before discussing concurrency, I would like to spend some time discussing what we mean by **"concurrency"**.

Most people usually refers the word  _concurrent_, as a process that occurs simultaneously with one or more processes.
There are other words such as "asynchronous", "parallelism", or "threads" that are grouped together with _concurrency_.
To think of _concurrency_ in an easy way is to think about our daily lives, you are concurrently reading this sentence while others in the world
are simultaneously coding some great software. They are existing _concurrently_ to us.

> Now let's go through some basic concepts of computing i.e **CPU**, **Cores** and **Parallelism**

Let's try to understand this with basic example of our daily lives. When we are working on
some project, we typically have several tasks to accomplish. Besides actually working on some tasks,
we also need to test all the features, talk with customers and provide support.

Working on a big project involves in a lot of work. So, it would be nice to have many people working on it.
But, of course, we would still need someone to manage the project and to make decisions. And with multiple people, 
it's possible to divide all the required tasks and do them in parallel.

Managing a project is the same as how a _CPU_ works. The CPU is our manager, it deals with a lof of requests
and divides the processing work among available cores. The cores, in turn, are the people working on the project.
They listen to _CPU_(HOST) instructions and execute the required tasks.

#### Processing Units

Computer systems that existed before 70s, used limited processing units due to complex integration of
transistors and logical gates on a large scale in a single chip.

> **Moore's Law** states that the number of components on a single chip doubles every two years at minimal cost. While not actual science, it was an observation and extrapolation that has held steady since 1965.
> However, In 1975, he revised the prediction to state that the number of components per single chip would double every two years.

This prediction more or less held true until just recently - around 2012

The number of transistors and logical ports in the same chip kept increasing in the following decades, and it was this way multiple processing cores were born and worked together in the same chip.

#### Processing Core
> **A core is a processing unit of the CPU**, It is responsible for executing programs and multiple other actions on a computer.

<p align="center">
<img src="/images/0_concurrency/Core-2.png"/>
</p>

#### CPU(Central Processing Unit)
> CPU consists of the component that coordinates cores for executing tasks in a computer systems.

In this way, a computer with a single CPU can simultaneously execute n tasks, where n is the number of cores. As a note, n is the total number of available threads if the CPU cores employ multithreading.

<p align="center">
<img src="/images/0_concurrency/cpu.png"/>
</p>

To summarize about _CPU_ and _Cores_

> In the old days, every processor had just one core that could focus on one task at a time. Today, _CPUs_ have been two and 18 cores, each of which can work on a different task.
> A core can work on one task, while another core works a different task, so the more cores a CPU has, the more efficient it is.

### Parallelism

> **Amdahl's law** describes a way in which to model the potential performance gains from implementing the solution to
> a problem in a parallel manner. Simply put, it sates that the gains are bounded by how much of the 
> program must be written in a sequential manner.

In other words, it does not matter how many processors you have or how much faster each processor may be; the maximum improvement in speed will always be limited by the most significant bottleneck in a system.

Let's understand this through an example, imagine you are working on a program that is largely GPU based:
a user is present with an interface, clicks on some buttons, and stiff happens. This type of program is
bounded by human interaction i.e a sequential program. No matter how many cores you make available to this program,
it will always be affected by how quickly user interacts with the interface.

Now consider a different example, calculating digits of pi, this problem is also called _embarrassingly parallel_, which means 
it can easily be divided into parallel tasks. In this case, **significant gains can be made by making more cores available
to the program**.
<p align="center">
<img src="/images/0_concurrency/amdahl.png"/>
</p>


### Thanks for Reading!

I'm trying to share my learning by writing small articles on it. I hope that you found this article to be helpful.

> I will be posting more articles on **Concurrency**, Stay tuned!


---