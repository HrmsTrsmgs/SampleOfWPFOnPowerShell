using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-2.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)

$window.ShowDialog()
