+++
title = "Email冷静期"
date = "2024-11-27T21:47:41+09:00"

#
# description is optional
#
# description = "An optional description for SEO. If not provided, an automatically created summary will be used."

tags = ["工具","日常","杂谈"]
+++

我就是那种写完 Email 头脑一热点击立即发送，随即就后悔有病句/歧义/语法错误/内容不完整 的人。

好在这个问题的解决方法也很简单，那就是"remember to always think twice"。既然有「离婚冷静期」，不妨把这个方法论称为「Email冷静期」好了。目前大致有以下几种实现：
- 手动定时发送。一般来说邮件的实时性并不强，拖个一天两天没有问题，不妨索性定时一天之后发送，中间有充足的时间可以后悔。
- 延时发送：在点击发送后并不直接发送，而是延迟一段时间后再发送。我印象中多年前罗永浩在演示他手机的短信功能时就有类似的实现。道理是我们往往是在发送的瞬间后悔，因此只需要简单的半分钟左右的延时发送便足以解决多种问题。
- 发送前确认。原理和延时发送类似，而且还多了防止在编辑过程中手滑直接enter发送邮件。

iPhone上的mail客户端似乎就带有延时发送的功能（目前我的系统版本是18.1.1），但是Mac上的mail似乎就没有这种功能（Sequoia 15.1.1）。除此之外，一点点的延时似乎还是让我感到不安。

我心中的解法是发送前确认，也就是点击发送的瞬间弹出一个对话框，问我是否要发送。但在Mac的客户端上似乎怎么也无法实现这一功能，可能对于绝大多数人来说都无此必要。我不确定在其他的一些付费的客户端比如[Spark](https://sparkmailapp.com/)是否有实现，但我找到了一个[Thunderbird插件的实现](https://addons.thunderbird.net/en-us/thunderbird/addon/check-before-sending-email/).

从插件的[预览图](https://addons.thunderbird.net/en-us/thunderbird/addon/check-before-sending-email/)就可以看出作者大概是日本人，这也符合人们对于日本人易于不安（读作ふあん）的刻板印象。更好笑的是这个插件不仅在发送的时候要求你手动确认发信人，收信人，邮件标题和内容，而且它还有一个默认设置：即便你确认了一切信息，它会将邮件放到一个本地的outbox，你需要手动再去最终发送。原谅我一个thunderbird新人可怎么也没找到办法把邮件从outbox发出去，还好这一默认设置可以取消。不知道这个插件是否最初为日本企业设计，如今我的印象是日企中用Outlook这种臃肿的客户端比较多，还在坚持Thunderbird的多少也颇有古风了。

This is a page about »Email_calm«.