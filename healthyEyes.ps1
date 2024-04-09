 # Version:        0.1
 # Author:         simislearning
 # Creation Date:  04/09/2024
 
$message = "Don't forget to blink your eyes and look 20 feets away!"
$fontSize = 48

Add-Type -AssemblyName System.Windows.Forms


$screens = [System.Windows.Forms.Screen]::AllScreens

$notificationWindows = @()

foreach ($screen in $screens) {
    $x = $screen.Bounds.X
    $y = $screen.Bounds.Y
    $width = $screen.Bounds.Width
    $height = $screen.Bounds.Height

 
    $notificationWindow = New-Object System.Windows.Window
    $notificationWindow.WindowStyle = 'None'
    $notificationWindow.Background = [System.Windows.Media.Brushes]::Yellow 
    $notificationWindow.Topmost = $true 

    $label = New-Object System.Windows.Controls.Label
    $label.Content = $message
    $label.FontSize = $fontSize
    $label.Foreground = [System.Windows.Media.Brushes]::Black 
    $label.HorizontalContentAlignment = 'Center'
    $label.VerticalContentAlignment = 'Center'

  
    $notificationWindow.Content = $label
    $notificationWindow.Left = $x
    $notificationWindow.Top = $y
    $notificationWindow.Width = $width
    $notificationWindow.Height = $height


    $notificationWindow.Show()


    $notificationWindows += $notificationWindow
}


Start-Sleep -Seconds 20
foreach ($window in $notificationWindows) {
    $window.Close()
}

while ($true) {
    Start-Sleep -Seconds (20 * 60) 
    foreach ($screen in $screens) {
        $x = $screen.Bounds.X
        $y = $screen.Bounds.Y
        $width = $screen.Bounds.Width
        $height = $screen.Bounds.Height


        $notificationWindow = New-Object System.Windows.Window
        $notificationWindow.WindowStyle = 'None' 
        $notificationWindow.Background = [System.Windows.Media.Brushes]::Yellow 
        $notificationWindow.Topmost = $true 

      
        $label = New-Object System.Windows.Controls.Label
        $label.Content = $message
        $label.FontSize = $fontSize
        $label.Foreground = [System.Windows.Media.Brushes]::Black 
        $label.HorizontalContentAlignment = 'Center'
        $label.VerticalContentAlignment = 'Center'


        $notificationWindow.Content = $label

       
        $notificationWindow.Left = $x
        $notificationWindow.Top = $y
        $notificationWindow.Width = $width
        $notificationWindow.Height = $height
        $notificationWindow.Show()
        $notificationWindows += $notificationWindow
    }

   
    Start-Sleep -Seconds 20
    foreach ($window in $notificationWindows) {
        $window.Close()
    }
}
