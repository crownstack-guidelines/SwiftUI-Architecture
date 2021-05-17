# SwiftUI-Architecture
This repo guides you to setup the architecture and can be used as a starter kit for your app in SwiftUI.
Some important questions that one should ask before starting building app.Which will make your work easier. 

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
 
