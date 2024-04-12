$DadJoke = Invoke-RestMethod -Uri https://icanhazdadjoke.com/ -Headers @{accept="text/plain"}
$URI = ""

## Start Teams Messages
$Text = '
{
   "@type": "MessageCard",
   "@context": "http://schema.org/extensions",
   "themeColor": "0076D7",
   "summary": "Random Dad Joke",
   "sections": [{
      "activityTitle": "Random Dad Joke.",
      "activitySubtitle": "Daaaaaaad.....",
      "activityImage": "https://st2.depositphotos.com/3903847/5567/v/950/depositphotos_55673891-stock-illustration-retro-dad.jpg",
      "facts": [{
         "name": "'+$DadJoke+'"
        }],
      "markdown": true
   }]
}
'
## Add webhook
$parameters = @{
    "URI" = $URI
    "Method" = 'POST'
    "Body" = $Text
    "ContentType" = 'application/json'
}

## Send Message
Invoke-RestMethod @parameters