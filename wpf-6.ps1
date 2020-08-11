using namespace System.Xml
using namespace System.Dynamic

function New-ExpandoObject([PSCustomObject]$source){
    $source = [PSCustomObject]$source
    $ret = New-Object ExpandoObject
    $source | Get-Member | ?{$_.MemberType -eq "NoteProperty"} | %{$ret.($_.Name) = $source.($_.Name)}
    return ,$ret
}

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-6.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)
$window.DataContext = New-ExpandoObject @{
    FirstName = "太郎";
    LastName = "佐藤"
}
$window.ShowDialog()

