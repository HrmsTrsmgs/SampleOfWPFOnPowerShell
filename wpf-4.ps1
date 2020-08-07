using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-4.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)
$label=$window.FindName("label")
$button=$window.FindName("button")
$label.Content = 1
$button.add_Click({$label.Content++})
$window.ShowDialog()
