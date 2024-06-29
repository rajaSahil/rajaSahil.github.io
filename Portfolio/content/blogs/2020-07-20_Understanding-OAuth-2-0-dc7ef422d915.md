---
title: "Understanding OAuth 2.0"
date: 2020-07-20T23:15:00+07:00
slug: oauth
category: OAuth 2.0
summary:  This is a beginner’s guide for understanding OAuth2.0 and it will provide a brief overview of OAuth.
description: This is a beginner’s guide for understanding OAuth2.0 and it will provide a brief overview of OAuth.
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

# Understanding OAuth 2.0

This is a beginner’s guide for understanding OAuth2.0 and it will provide a brief overview of OAuth.

![](https://cdn-images-1.medium.com/max/800/1*e2x6biTeTNWeMc-C4aPogw.jpeg)

This is a beginner’s guide for understanding OAuth2.0 and it will provide a brief overview of OAuth.

> OAuth! What is this? Is this have to do something with authentication or authorization! Ugghhh Confused.

Let’s start with some terminologies that are required to understand OAuth:

1.  **Authentication.**
2.  **Authorization**.

### Authentication

*   Authentication is the process of proving your **own identity** to third party service. It verifies whether a person’s identity is the same as he or she had declared himself or herself to be.
*   So when we are trying to log in to Facebook or Google, we are required to first enter the email and password to verify our identity. This is what Authentication is.

![](https://cdn-images-1.medium.com/max/800/1*7tf-DQ95_2deaYwD2PTO0w.png)

### Authorization

*   Authorization is the process of giving someone permission to do something or have something. In this process, a person grants another person to have some of its resources or use some of its resources.
*   It is done after successful Authentication. Here an **Authorization server** is providing access to third-party services to use some of its resources.

![](https://cdn-images-1.medium.com/max/800/1*GDfzy8kYR43TTnds3fuBiA.png)

> In the above example, the **Authorization server is Google** who is providing access to **Tableau Desktop(Third-party service)** to use some of its resources.

### OAuth

OAuth 2.0 is the industry-standard protocol for **authorization** and anyone can implement it. So from now on, whenever I say _“OAuth”_, I’m talking about OAuth 2.0.

> **OAuth 2.0 is not an authentication protocol.**

![](https://cdn-images-1.medium.com/max/800/1*b8IseUJr-ewOdksidVRSiA.png)

OAuth is meant for Authorization and not for authentication.

**More specifically, OAuth was not created for service to authorize a person, it is meant for service to authorize another service.**

#### Why OAuth?

Let’s try to understand this with an example.

*   Suppose you have a photo editing application. And to edit photos it needs to access photos from Google photos. So every user needs to provide Google’s email and password to this application so the app can edit those photos.

![](https://cdn-images-1.medium.com/max/800/1*kVQzf-WhXK-VfiOTIfMqQg.png)

*   _So are you going to provide the credentials of google to some other application?_ **Obviously NO!**

Then there must be another way to give access to this photo editing application to edit your photos. This is where OAuth helps!

![](https://cdn-images-1.medium.com/max/800/1*zA2bU19wCBbXcze9wRLbnA.png)

#### Using OAuth

Using OAuth, the scenario would be different.

*   Now, this photo editing application will have to first take authorization from Google(Resource server) which will provide access only for photos to this application and it will be provided for a limited period.

![](https://cdn-images-1.medium.com/max/800/1*OIUi5yzYPpNg1P1B3z0FKA.png)

*   This is an overall brief overview of how OAuth works(High level).

> **Well, this GIF says it all!**

So, now the question comes how?

### OAuth Actors:

1.  **Resource Owner**
2.  **Resource Server**
3.  **Client**
4.  **Authorization Server**

#### Resource Owner

An entity capable of granting access to protected resources. User is a resource owner who allows the google photos service to share photos with some third party service.

#### Resource Server

The server which has all the protected resources. Google photos service is a resource server who has all the photos.

#### Client

An application making protected resource request on behalf of its resource owner and with its authorization.

#### Authorization server

This is the server that issue access token to the clients. It is the main engine of OAuth.

#### Note :

Google implements **OAuth** that’s why all the authorization activity is done by the **Authorization server** and all resource sharing is done by **Resource Server**.

### OAuth Tokens

**Access tokens** are the token the client uses to access the Resource Server (API). They have very short lifetime i.e they expire within some minutes or hours.

**Refresh Tokens** are the tokens that the client uses to get a new Access token. Their lifetime is much longer than access tokens i.e days, month and years.

### OAuth Flow

The requesting, granting, and life management of this tokens are often referred to as a “flow”. The OAuth specification allows for several ways of obtaining and validating tokens, and not all flows are meant for all types of clients.

There are more than one flows available for OAuth. I will be mainly talking about **Authorization Code Flow** and **Implicit Flow**

1.  **Authorization Code Flow**

*   This flow is the most widely spread OAuth flow. To obtain the token using this flow, the client sends an authorization request to the OAuth server. The server makes sure that the user(resource owner) is authenticated and ask the user to approve this request. When the user approves, an **Authorization Token** is issued which the client again passes to the authorization server and an **Access token**(short-lived) is issued to the client. The client can now access the resources from the resource server by giving this access token i.e it can be considered as a password which is alive for a given duration of time.
*   Along with an access token, **Refresh token** is also issued to the client, which can be used to generate a new access token without the involvement of the user.
*   The flow could look as follows:

![](https://cdn-images-1.medium.com/max/800/1*asWgcsgvCxObFlju_pSzaw.png)

**2\. Implicit Code flow**

*   The only difference between Authorization code and Implicit code flow is here client doesn’t get **Auth token.** Else everything remains the same.
*   Access Token and Refresh Token are issued directly by the authorization server.
*   The flow could look as follows:

![](https://cdn-images-1.medium.com/max/800/1*aDAjqHOrsVrMnorl0MJ4LA.png)

With this, we briefly discussed some of the concepts that are required to understand OAuth and its flow. The OAuth implementation depends on the service and how they implement it. It can differ from service to service and how OAuth is implemented.

### Thanks for Reading!

I hope that you found this article to be helpful. I will be posting more articles on **OAuth flows** and **Token Revocation**.

By [Sahil](https://medium.com/@rajasahil) on [July 20, 2020](https://medium.com/p/dc7ef422d915).

[Canonical link](https://medium.com/@rajasahil/understanding-oauth-2-0-dc7ef422d915)

Exported from [Medium](https://rajasahil.medium.comm) on June 29, 2024.