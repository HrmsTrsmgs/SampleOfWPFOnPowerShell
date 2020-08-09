using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-5.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)

class PSClass
{
    [string]$FirstName
    [string]$LastName
}

$obj = New-Object PSClass
$obj.FirstName = "太郎"
$obj.LastName = "佐藤"

$window.DataContext = $obj
$window.ShowDialog()
