using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-3.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)

$label=$window.FindName("label")
$label.Content = "Hello"

$window.ShowDialog()
