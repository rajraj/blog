---
title: "Where do I put my secret key in Expo project"
date: 2018-07-02T11:49:25-04:00
draft: true
description: "Where do we put a secret key in expo. A plain js file or do we have a better solution?"
tags: ["expo", "tips", "react-native"]
---

# Where do I put my secret key in Expo project

So you decided to build a react-native project using [Expo](https://expo.io/), great choice. Also you maybe want to use [Firebase](https://firebase.google.com/) to quick prototyping your application. Nice you really want to hit the market as quick as possible. But now you get with a question almost all of us who work with Expo got. **Where do I put my secret key in Expo project**.

So I was looking for some tutorial around the web and all of them was not really secure. I mean they put the key inside a constants file and then import this key right inside the js project. I don't like this idea, this key can become really vulnerable when your app hit the market.

So how can I store it if we use Expo. If you do some search in the [docs](https://docs.expo.io/versions/latest/guides/configuration.html) you can find that the `app.json` file can be the solution. As they say *Most configuration from app.json is accessible at runtime from your JavaScript code via Expo.Constants.manifest. Sensitive information such as secret keys is removed. See the "extra" key below for information about how to pass arbitrary configuration data to your app.*

Yes, we gonna follow this pattern in this little tutorial. Why do a tutorial about this? First, because I didn't know about this a week ago. Second I just think a lot of people don't' know it and I want to share it with you :)

## Tutorial

### 1. Initialize an expo project

First, you need to have Expo install in your machine. Just follow the installation process [here](https://docs.expo.io/versions/v28.0.0/introduction/installation). After we create a brand new project with the command line `exp init expo-secret` you can change expo-secret for the name of your app. After this, a prompt gonna ask you for a template choose blank.

![](https://preview.ibb.co/eoccCJ/Screen_Shot_2018_07_02_at_11_54_07_a_m.png" alt="Screen_Shot_2018_07_02_at_11_54_07_a_m)

When all is installed cd in the project, run the project with `exp start` and open a new terminal for running on device `exp ios` or `exp android`. You should see this.

![](https://preview.ibb.co/hU2oKy/Screen_Shot_2018_07_02_at_12_19_32_p_m.png" alt="Screen_Shot_2018_07_02_at_12_19_32_p_m)

### 2. Add a secret key

Open `app.json` who is inside the root folder and add the `extra` key in the expo object. Should look like this.

![](https://preview.ibb.co/bZQTmd/code.png)

### 3. Restart exp server

To make sure the key gonna be accessible, we need to restart the expo server. In your first terminal do `ctrl-c` to cancel the exp server we have. Rerun in the same terminal `exp start`. Also, you need to close the project in the simulator and restart it with `exp ios`.

### 4. Add secret in your app

Open `App.js`, import the Constants object from expo library. The secret key gonna be inside `Constants.manifest.extra.<name of the key>`.

So if your code looks like this.

![](https://preview.ibb.co/fsgesJ/appwithsecret.png)

You should be able to see it now inside your simulator.

![](https://preview.ibb.co/euf5XJ/Screen_Shot_2018_07_02_at_12_29_13_p_m.png" alt="Screen_Shot_2018_07_02_at_12_29_13_p_m)

## Final word

So as you can see, this is really not complicated and I think this is better than having this in a plain javascript file. Also yes your key can provide an object like the firebase config.

```js
"extra": {
  "firebaseConfig": {
    "apiKey": "apikey",
    "authDomain": "authDomain",
    "databaseURL": "databaseURL",
    "projectId": "projectId",
    "storageBucket": "storageBucket",
    "messagingSenderId": "messagingSenderId"
  },
}
```

And you can use it right in the project when you initialized it.

```js
firebase.initializeApp(Constants.manifest.extra.firebaseConfig);
```

Let me know what you think of it. If you have any comment or you found I typo I will really appreciate it :).

**Repo of the project [here](https://github.com/EQuimper/secret-key-in-expo).**