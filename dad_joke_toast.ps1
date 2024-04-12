$DadJoke = Invoke-RestMethod -Uri https://icanhazdadjoke.com/ -Headers @{accept="text/plain"}

$xml = @"
<toast>
  
  <visual>
    <binding template="ToastGeneric">
      <text>Random Dad Joke</text>
      <text>$DadJoke</text>
    </binding>
  </visual>

  <audio silent="true"/>
  
</toast>
"@
$XmlDocument = [Windows.Data.Xml.Dom.XmlDocument, Windows.Data.Xml.Dom.XmlDocument, ContentType = WindowsRuntime]::New()
$XmlDocument.loadXml($xml)
$AppId = '{1AC14E77-02E7-4E5D-B744-2EB1AE5198B7}\WindowsPowerShell\v1.0\powershell.exe'
[Windows.UI.Notifications.ToastNotificationManager, Windows.UI.Notifications, ContentType = WindowsRuntime]::CreateToastNotifier($AppId).Show($XmlDocument)

#Male
Add-Type -AssemblyName System.speech
([System.Speech.Synthesis.SpeechSynthesizer]::New()).Speak($DadJoke)