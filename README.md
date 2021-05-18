# SwiftUI-Architecture
This repo guides you to setup the architecture and can be used as a starter kit for your app in SwiftUI.
Some important questions that one should ask before starting building app.Which will make your work easier. 

## App Theme

Inspired by react-native styled component themeing system. iOS can skip reading this (https://styled-system.com/).
We took a reference from (https://www.freecodecamp.org/news/how-to-build-design-system-with-swiftui/)

App theme is the important part of an app and to make it consistent throughout an app is necessary.

But how to manage theme of your app?

In this repo I have created two structs which will helpful for handling the theme throughout the app and below you will find how to use it :

On the parent view use environment modifier to apply the theme by giving relevant keypath.
![Screenshot 2021-05-17 at 6 47 10 PM](https://user-images.githubusercontent.com/81283951/118495336-bb1d9480-b740-11eb-8182-2c9583780aae.png)

These two files you can refer to know more about how its working.
![Screenshot 2021-05-17 at 6 48 00 PM](https://user-images.githubusercontent.com/81283951/118495144-8a3d5f80-b740-11eb-8dbb-fdf50553b234.png)

For handling the multiple themes based on light and dark mode, create a new assest catalog file as done below :-

![Screenshot 2021-05-17 at 6 55 25 PM](https://user-images.githubusercontent.com/81283951/118496271-9675ec80-b741-11eb-8c5b-827f7f5b7b7e.png)
![Screenshot 2021-05-17 at 6 56 01 PM](https://user-images.githubusercontent.com/81283951/118496346-ac83ad00-b741-11eb-9def-d8c5e6018b98.png)

Create a new color set inside this file and set the color based on appearance (dark or light) like below :-

![Screenshot 2021-05-17 at 7 02 01 PM](https://user-images.githubusercontent.com/81283951/118497135-6b3fcd00-b742-11eb-8632-f6ecbd4da214.png)

![Screenshot 2021-05-17 at 6 59 29 PM](https://user-images.githubusercontent.com/81283951/118496982-44819680-b742-11eb-82db-00ae6278321f.png)

You can use these color palatte in code like :- 
![Screenshot 2021-05-17 at 7 04 45 PM](https://user-images.githubusercontent.com/81283951/118497766-ff119900-b742-11eb-899c-2fb7bc8d5428.png)

Now we have created the theme, we can use it in our view by following example - 

![Screenshot 2021-05-18 at 11 25 03 AM](https://user-images.githubusercontent.com/81283951/118598611-f6b17080-b7cb-11eb-963b-4a640fe30bd2.png)

Let's check how our view looks now on each mode (light or dark) :-

![Screenshot 2021-05-18 at 11 17 47 AM](https://user-images.githubusercontent.com/81283951/118598701-219bc480-b7cc-11eb-8e48-421fbd7d934c.png)
![Screenshot 2021-05-18 at 11 17 26 AM](https://user-images.githubusercontent.com/81283951/118598724-29f3ff80-b7cc-11eb-9299-21c631930f90.png)
 

 
