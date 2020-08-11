using namespace System.Xml

Add-Type -AssemblyName PresentationFramework
Add-Type '
using System.ComponentModel;
using System.Runtime.CompilerServices;
public class Name : INotifyPropertyChanged
{
    public event PropertyChangedEventHandler PropertyChanged;
    void Set<T>(ref T field, T value, [CallerMemberName] string propertyName = "")
    {
        if(!field.Equals(value))
        {
            field = value;
            if (PropertyChanged != null)
            {
                PropertyChanged(this, new PropertyChangedEventArgs(propertyName));
            }
        }
    }
    string firstName = "";
    public string FirstName
    {
        get{return firstName;}
        set{Set(ref firstName, value);}
    }
    string lastName = "";
    public string LastName
    {
        get{return lastName;}
        set{Set(ref lastName, value);}
    }
}
'
[xml]$xaml = Get-Content .\wpf-8.xaml
$nodeReader = (New-Object XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($nodeReader)
$name = New-Object Name
$name.LastName = "佐藤"
$name.FirstName = "太郎"
$window.DataContext = $name

$window.ShowDialog()