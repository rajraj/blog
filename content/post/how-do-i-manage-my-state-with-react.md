---
title: "How do I Manage my State with React"
linktitle: "How do I Manage my State with React"
date: 2018-05-10T17:37:40-04:00
description: "How do I manage my state in my react application"
tags: ["react", "redux", "formik", "mobx-state-tree", "mobx", "thinking"]
---

## Intro

**SML** -> State management library -> like Redux or Mobx

**P.S** This is just my thinking, this is not a best practice guide etc, just what I found best for the app I build.

When building an app with react or react-native we came with a lot of choices. One of the most important ones is what to do with the state, where should I put it, how to use it, and how to make it easy to maintain.

These questions are surely asked by a lot of you. React give you a freedom, other lib-framework don't give you. But that came with a cost. You need to take more decision, less convention, etc...

One question I always asked myself before creating state it's which component needs to know about it. If you say lot and lot of component you already answer yourself. Global state manager can help you in this case. But if the answer is this component and his children, probably better to keep it at component level state.

### Form state

So why not start with something I think everyone or the big majority would say same as me. Don't put form state in redux or any other lib like this. Use component lever state or tool like [formik](https://github.com/jaredpalmer/formik) or [react-final-form](https://github.com/final-form/react-final-form). I know before you most have used another lib like redux-form etc. But make sure to try these libs. They gonna change your way of thinking with form. They gonna help you make the form easier. For me my choice is Formik, I like to use it with [yup](https://github.com/jquense/yup) for creating validation schema.

But I want to get the result of the login form inside my SML, how can I do this? Have seen this question a lot and the funny part of it is the answer is inside the question. **The Result**. Let Formik managed your form, handle the error, submit etc. And when you know all is good now push the result to your SML. Trust me, after building like 2-3 form, you don't gonna be able to live without Formik and yup.

### Animation state

Again this one should be handle component level state. By doing it this way, you can reuse this component with animation in another project. Remember if you build a project today with Redux and you handle stuff in it example like this animation stuff. If you want to reuse it you gonna need first to use redux in a new project + came with all the boilerplate code he took for. By doing it component level state, it's almost one file copy and pastes and you get it. "Or you can put your component as an NPM package :)".

### App State

When you build a modern app you need to know a lot about the current state of the app. Do the user is online or offline, location, app foreground or background in react-native, etc...

This kind of state I really like to manage it with an SML. Why? Remember my question earlier, which component need it? First, this is not even just component some function gonna need to know about this. Example if offline you maybe gonna store what the user tries to send right now and push it back to the server when back online. After that maybe you want to show a little toastr or any other visual component who say app offline.

For the location example if you keep it as a global you make sure than each component who need this value gonna have the same. SO if you build an app with a map + something else both gonna have the same source of truth.

### Modal, toastr, theme manager

This one again I go with SML or now with the [context api](https://medium.com/dailyjs/reacts-%EF%B8%8F-new-context-api-70c9fe01596b). First, for toastr and modal, I think this is much simpler to keep just one instance of them. What do I mean by that? I talk about example having one component who is the modal parent. He handles if the modal show or which type. Example if this is a welcome modal or a modal for a certain action.
But this one connect with your SML, why? Because the action for open the modal gonna be use surely deeply in your app and you don't want to pass down this action 20 levels deep.

For the theme, I think you don't have another choice. You can use the new context API who I think it's awesome for this kind of stuff or you can use your SML for this.

### User state

This one is surely one of the most basic ones we all use. Keeping the current viewer state. If the user is logged or not, avatar URL etc. I think this one should be handled in the SML. The navbar lot of time need the avatar URL and also if the user is logged for showing some link or not. But somewhere else also in the app. Also if the user sees his profile maybe he can be updated but if he looks at someone else this is just a plain view.

### Conclusion

I hope this little article has helped you at some point. If your question is which SML I like the most, I think right now is [mobx-state-tree](https://github.com/mobxjs/mobx-state-tree) who is like redux meet mobx.

Hope you see why React state can be really useful and don't make the same mistake I make when I started, just use SML state and no more component level state.

Let me know in the comment if you have any question or you find some typo :)
