using namespace System.Xml
using namespace System.Dynamic
using namespace System.Collections.ObjectModel

function New-ExpandoObject([PSCustomObject]$source){
    $source = [PSCustomObject]$source
    $ret = New-Object ExpandoObject
    $source | Get-Member | ?{$_.MemberType -eq "NoteProperty"} | %{$ret.($_.Name) = $source.($_.Name)}
    return ,$ret
}

Add-Type -AssemblyName PresentationFramework
[xml]$xaml = Get-Content .\wpf-7.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)
$button = $window.FindName("button")
$collection = New-Object ObservableCollection[ExpandoObject]
$window.DataContext = $collection
$button.add_Click({
    $collection.Add((New-ExpandoObject @{FirstName="";LastName=""}))
})
$window.ShowDialog()

