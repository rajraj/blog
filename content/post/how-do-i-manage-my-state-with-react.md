---
title: "How do I Manage my State with React"
linktitle: "How do I Manage my State with React"
date: 2018-05-13T10:37:40-04:00
description: "How do I manage my state in my react application"
tags: ["react", "redux", "formik", "mobx-state-tree", "mobx", "opinion", "article"]
---

## Intro

**SML** -> State management library -> like Redux or Mobx

**P.S** This is just my opinion, this is not a best practice guide etc, just what I found best for the app I built recently.

When building an app with react or react-native I had lots of options. One of the most important option was how to manage state, where should I put it, how to use it, and lastly how make it easy to maintain.

These are common questions before starting most projects I believe. React gives us a freedom that, other libraries and frameworks don't give you, but React comes with it's own costs. You need to make more decisions, code with fewer conventions, etc...

One question I always ask myself before creating state is which components are involved in the state. If you believe many components will be involved then the answer is more obvious than when few components are involved. SML can help you in these cases, but if the answer is this component and his children, probably better to keep it at component level state.

### Form state

So why not start with something I think the majority would agree with me. Don't put form state in redux or any other lib, use component level state or tool like [formik](https://github.com/jaredpalmer/formik) or [react-final-form](https://github.com/final-form/react-final-form). I believe many developers have used another library like redux-form etc, but make sure to try these libs. Formik and React-Final-Form are going to change the way you think about Form state. They gonna help you make the managing of Form state easier than before when used.

Personally I prefer Formik, I like to use it with [Yup](https://github.com/jquense/yup) for creating validation schema.

I want to get the result of the login form inside my SML. You may wonder how can I do this? I have seen this question quite often and the answer is inside the question. **The Result**, let Formik manage your form, handle the error and submit. Then when you know all is good now push the result to your SML. Trust me, after building like 2-3 forms, you will not be able to live without Formik and Yup again.

### Animation state

The state should be managed at the component level state. By doing it this way, you can reuse this component with animation in another project. Remember if you build a project today with Redux and you handle this state with it and you want to reuse it you gonna need first to use redux in a new project + came with all the boilerplate code he took for. By creating it component level state, it's almost one file copy and pastes and you transferred a workable component to your new project, or you can upload component as an NPM package. :)

### App State

When you build a modern app you need to know a great deal about the current state of the app. Is the user is online or offline? Is their location important? What is part of the app runs foreground or background in react-native, etc...

This kind of state I really like to manage with SML. Why? Remember my question earlier about which components are involved? First, this is not even just component, some function gonna need to know about this. Example if offline you maybe gonna store what the user tries to send right now and push it back to the server when back online. Then maybe you want to show a little toastr or any other visual component who say app offline.

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
