using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-5.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)
$window.DataContext = [PSCustomObject]@{
    FirstName = "太郎";
    LastName = "佐藤"
}
$window.ShowDialog()
