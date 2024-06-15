# Pause Menu: ALPHA #

Simple standalone pause menu script following the design of our alpha load screen.<br>
Pause menu is coded using HTML/CSS/LUA/JQUERY.<br>
All images, text, and colours can be easily edited, full instructions can be found below.<br>

## Features ##

- Pause menu with 6 functional buttons
- News container
- Server rules container
- Report system with discord webhooks
- Settings button to toggle gta settings
- Disconnect button to quickly leave server

## Credits ##
- AbstractBunny(redid code and fixed exploits)

## Install ##

1) Customise HTML and CSS accordingly to fit your server, refer to instructions below if unsure.
2) Customise `config_sv.lua` making sure to include your `webhook` link.
3) Rename the folder to `boii-pausemenu` and drag into your server resources.
4) Add `ensure boii-pausemenu` into your `server.cfg`

## Editing discord settings ##
- Edit your discord bot and webhook settings inside `config_sv.lua`
```
Config = {}
-- Discord settings
Config.Discord = {
    -- Discord webhooks refer to; https://support.discord.com/hc/en-us/articles/228383668-Intro-to-Webhooks
    Webhook = 'YOUR_DISCORD_WEBHOOK',
    -- Webhook colour can find more here; -- https://www.spycolor.com/
    Colour = 5098434, -- boii development brand blue 
    -- Discord bot username;
    BotData = {
        Name = '-🛡️- BOII REPORTS -🛡️-',
        Logo = 'https://i.imgur.com/3g0XonA.png',
        Footer = {
            Text = '© - BOII | Development ',
            Icon = 'https://i.imgur.com/3g0XonA.png'
        },
    }
}
```

## Editing HTML ##

Server name; 
- At `line: 27` edit `<h1 id="sv-name">BOII DEVELOPMENT</h1>`

Content headers; 
- At `line: 33` edit `<h1 class="content-header">NEWS</h1>`
- At `line: 45` edit `<h1 class="content-header">RULES</h1>`
- At `line: 70` edit `<h1 class="content-header">STAFF</h1>`

Menu buttons; 
- From `line: 96` to `line: 101` edit the following;
```
<button class="content-btn1">HOME</button>
<button class="content-btn2">NEWS</button>
<button class="content-btn3">RULES</button>
<button class="content-btn4">STAFF</button>
<button class="content-btn5">TRAILER</button>
```

News posts;
- At `line:47` edit the following; 
```
<div><img src="img/news1.jpg" alt="1" class="news-img"><p class="content-text">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p></div>
```
- You can remove the additional template posts at `line: 35` & `line: 40` don't forget to remove the `<br></br>`
- You can add as many posts as you like the container will scroll

Rules; 
- Starting at `line: 47` edit the rules list
- You can add as many rules as you like the container will scroll

Reports;
- From `line: 73` to `line: 88` you can edit the reports form

Report submit button; 
- Edit the report `submit` button on `line: 89`
```
<button type="submit" id="form-submit-btn">SUBMIT</button>
```

Report failed; 
- From `line: 91` to `line: 94` edit the container text and button
```
<div id="form-alert-container" class="hidden">PLEASE ENSURE THAT ALL FIELDS ARE FILLED BEFORE SUBMITTING A REPORT!
<br>
<button class="form-failed-btn">CLOSE</button>
</div>
```

## Editing CSS ##

Overlay;
- Edit the main overlay from `line: 23`
```
/* Left side overlay */
.menu-overlay {
    position: fixed;
    left: -10%;
    height: 100%;
    width: 25%;
    background-color: rgba(31, 30, 30, 0.9); /* Edit background colour here */
    transform: skew(-15deg);
    border: 1px solid #4dcbc2; /* Edit border colour here */
    border-top: none;
    border-bottom: none;
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 40px 2px; /* Edit box shadow here */
}
```

Header & logo;
- Edit the header container and logo from `line: 37` 
```
/* Header & logo */
.header-container {
    position: fixed;
    top: 4%;
    left: 4.5%;
    height: 3%;
    width: 16%;
    text-align: left;
    font-size: 0.8rem;
    color: #fff;
    text-shadow: 0px 0px 10px #4DCBC2; /* Edit text shadow here */
}
.logo-container > logo {
    position: fixed;
    top: 2.5%;
    left: 1%;
    height: 6%;
    width: 3%;
    border-radius: 30%;
    background-size: cover;
    background-position: center center;
    background-image: url('img/logo.png'); // Edit header logo here
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 10px 2px; /* Edit box shadow here */
}
```

Menu buttons; 
- Edit menu buttons from `line: 62`
- There is 6 buttons here to edit
```
/* Menu buttons */
.content-btn1 {
    position: fixed;
    top: 25%;
    left: 13%;
    height: 5%;
    width: 10%;
    border: 1px solid #4dcbc2; /* Edit border here */
    background-color: rgba(31, 30, 30, 1); /* Edit background colour here */
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 5px 2px; /* Edit box shadow here */
    transform: skew(-15deg); 
    text-align: center;
    font-size: 20px;
    color: #fff; /* Edit colour here */
}
.content-btn1:hover {
    color: #4DCBC2; /* Edit colour here */
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 15px 2px; /* Edit box shadow here */
}
```

Report form; 
- Edit the report form from `line: 207`
```
/* Form stuff */
.form-container {
    position: relative;
    top: -5%;
    left: 1%;
    height: 80%;
    width: 95%;
    border: 0px solid #1f1e1e;
    color: #fff;
    text-shadow: 0px 0px 10px #1f1e1e; /* Edit text shadow here */
}
.form-container > input {
    position: relative;
    height: 5%;
    width: 99.7%;
    border: 1px solid #1f1e1e;
    box-shadow: rgba(31, 30, 30, 0.65) 0px 0px 10px 2px; /* Edit box shadow here */
    color: #fff;
    background-color: rgba(31, 30, 30, 0.9); /* Edit background colour here */
}
.form-container > select {
    position: relative;
    height: 5%;
    width: 100%;
    border: 1px solid #1f1e1e;
    box-shadow: rgba(31, 30, 30, 0.65) 0px 0px 10px 2px; /* Edit box shadow here */
    color: #fff;
    background-color: rgba(31, 30, 30, 0.9); /* Edit background colour here */
}
textarea {
    position: relative;
    height: 20%;
    width: 99.7%;
    text-position: top;
    display: flex;
    resize: none;
    border: 1px solid #1f1e1e;
    box-shadow: rgba(31, 30, 30, 0.85) 0px 0px 10px 2px; /* Edit box shadow here */
    color: #fff;
    background-color: rgba(31, 30, 30, 0.9); /* Edit background colour here */
}
```

Form submit button; 
- Edit the form submit button from `line: 248`
```
#form-submit-btn {
    position: relative;
    left: 84%;
    height: 8%;
    width: 16%;
    border: 1px solid #4dcbc2; /* Edit border here */
    background-color: rgba(31, 30, 30, 0.9); /* Edit background colour here */
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 5px 2px; /* Edit box shadow here */
    text-align: center;
    font-size: 20px;
    color: #fff; /* Edit colour here */
}
#form-submit-btn:hover {
    color: #4DCBC2; /* Edit colour here */
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 15px 2px; /* Edit box shadow here */
}
```

Form failed container; 
- Edit the form failed popup container from `line: 264`
```
#form-alert-container {
    position: fixed;
    left: 35%;
    top: 38%;
    height: 15%;
    width: 25%;
    border: 1px solid #4dcbc2; /* Edit border here */
    background-color: rgba(31, 30, 30, 0.9); /* Edit background colour here */
    box-shadow: rgba(77, 203, 195, 0.56) 0px 0px 5px 2px; /* Edit box shadow here */
    text-align: center;
    font-size: 20px;
    color: #fff; /* Edit colour here */
}
```

Form failed button; 
- Edit the form failed button from `line: 277`
```
.form-failed-btn {
    position: relative;
    top: 3%;
    height: 25%;
    width: 30%;
    border: 0px solid #4dcbc2; /* Edit border here */
    background-color: rgba(31, 30, 30, 0.0); /* Edit background colour here */
    text-align: center;
    font-size: 20px;
    color: #fff; /* Edit colour here */
    text-shadow: 0px 0px 10px #4DCBC2; /* Edit text shadow here */
}
.form-failed-btn:hover {
    color: #4DCBC2; /* Edit colour here */
    text-shadow: 0px 0px 10px #4DCBC2; /* Edit text shadow here */
}
```

News grid; 
- Edit the news grid from `line: 294`
```
/* News grid */
.news-grid {
    display: inline-block;
    grid-template-columns: auto auto auto auto;
    width: 90%;
    height: 10%;
    gap: 10% 00%;
    background-color: none;
    padding: 1.5%
}
.news-grid > div {
    background-color: none;
    text-align: center;
    font-size: 1.5rem;
}
.news-img {
    fit: cover;
    max-width: 100%;
    box-shadow: rgba(31, 30, 30, 0.65) 0px 0px 10px 2px; /* Edit box shadow here */
}
```

Headers & paragraphs;
- Edit the content header & text from `line: 315`
```
/* Content texts */
.content-header {
    color: #fff; /* Edit colour here */
    font-size: 4rem;
    text-shadow: 0px 0px 10px #1f1e1e; /* Edit text shadow here */
    padding: 1%
}
.content-text {
    color: #fff; /* Edit colour here */
    font-size: 1.2rem;
    text-shadow: 0px 0px 10px #1f1e1e; /* Edit text shadow here */
    padding: 1%
}
```
## Preview ##
[YouTube](https://www.youtube.com/watch?v=hBPwCTOVkDw)

## Support ##
[Discord](https://discord.gg/MUckUyS5Kq)
