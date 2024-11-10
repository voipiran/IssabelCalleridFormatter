# IssabelCalleridFormatter
Translation:

Caller number correction, suitable for local landlines in Iran: Sometimes, incoming numbers are missing the initial "0" or include extra numbers and symbols like "98." With this script, the incoming caller ID is corrected as it enters your telephony system. This script is crucial for reporting modules and applications.

اصلاح شماره تماس گرنده، مناسب برای خطوط شهری داخلی ایران، برخی مواقع شماره های ورودی بدون 0 اولیه یا همراه با عدد ها وعلائم اضافی مثل 98 است، با این اسکریپت در ورودی سیستم تلفنی شما کالر آی دی ورودی اصلاح می شود. این اسکریپ برای ماژول ها و برنامه های گزارشگیری بسیار حیاتی است.
.
## Instalation (راهنمای نصب)
1. run on your Linux CLI.

دستور زیر را بر روی کنسول لینوکس ایزابل خود اجرا کنید.
```
curl -L -o IssabelCalleridFormatter.zip https://github.com/voipiran/IssabelCalleridFormatter/archive/master.zip && unzip IssabelCalleridFormatter.zip && cd IssabelCalleridFormatter-main && chmod 755 install.sh && ./install.sh -y
```
2. Change the Trunk incoming context to   context=to-cidformatter

در تعریف ترانک ورودی شهری خود کانتکس را به context=to-cidformatter تغییر دهد.

## Give a Star! ⭐ یک ستاره با ما بدهید
If you like this project or plan to use it in the future, please give it a star. Thanks 🙏
