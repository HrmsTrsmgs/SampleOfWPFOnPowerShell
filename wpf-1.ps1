using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = '
<Window xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" 
xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
Width="100" Height="100">
Hello WPF!!
</Window>'

$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)

$window.ShowDialog()
