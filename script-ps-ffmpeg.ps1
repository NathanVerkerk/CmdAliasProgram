#####################################################################################################
#Form type toevoegen
#Clear-Host
Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()
Add-Type -AssemblyName System.Drawing

#Standaard form settings in variables zetten
$font = New-Object System.Drawing.Font('Microsoft Sans Serif',12)
$screensize = 800,600

#Standaard naam voor als er geen naam ingevuld wordt
$defaultnaam = "Uw naam"

#Standaard directory waar de file browse in start
$StandaardDirectory = "C:\Users\" + "$env:USERNAME" + "\Downloads"

#Directory waar de downloadable files komen
$outputdir = "C:\ffmpeg files\downloads\"

#Datum - gebruikt voor filenames
$Date = Get-Date -Format "dd-MM-yyyy"

#Filebrowser aanmaken
$browsevid = New-Object -TypeName System.Windows.Forms.OpenFileDialog
#Standaard directory waar de filebrowser in start
$browsevid.InitialDirectory = $StandaardDirectory
#Filter voor de geaccepteerde bestanden
$browsevid.Filter = "mp4 files (*.mp4)|*.mp4"
#Destination aangeven waar het bestand heen gaat
$destinationvid = 'C:\ffmpeg files\upload'

#Filebrowser aanmaken
$browselogo = New-Object -TypeName System.Windows.Forms.OpenFileDialog
#Standaard directory waar de filebrowser in start
$browselogo.InitialDirectory = $StandaardDirectory
#Filter voor de geaccepteerde bestanden
$browselogo.Filter = "png files (*.png)|*.png|jpg files (*.jpg)|*.jpg|jpeg files (*.jpeg)|*.jpeg"
#Destination aangeven waar het bestand heen gaat
$destinationvid2 = 'C:\ffmpeg files\upload 2'

#Filebrowser aanmaken
$browseaud = New-Object -TypeName System.Windows.Forms.OpenFileDialog
#Standaard directory waar de filebrowser in start
$browseaud.InitialDirectory = $StandaardDirectory
#Filter voor de geaccepteerde bestanden
$browseaud.Filter = "mp3 files (*.mp3)|*.mp3"
#Destination aangeven waar het bestand heen gaat
$destinationvid2 = 'C:\ffmpeg files\upload 2'

#####################################################################################################
#Uploadcompleted pagina
$uploadcompleted                   = New-Object System.Windows.Forms.Form
$uploadcompleted.ClientSize        = New-Object System.Drawing.Point(400,114)
$uploadcompleted.Text              = "Upload Completed"
$uploadcompleted.TopMost           = $true
$uploadcompleted.StartPosition     = "CenterScreen"
$uploadcompleted.FormBorderStyle   = 'Fixed3D'
$uploadcompleted.MaximizeBox       = $false

$uploadcompletedlabel              = New-Object -TypeName System.Windows.Forms.Label
$uploadcompletedlabel.Text         = 'Upload completed successfully'
$uploadcompletedlabel.AutoSize     = $false
$uploadcompletedlabel.Width        = 300
$uploadcompletedlabel.Height       = 100
$uploadcompletedlabel.Font         = $font
$uploadcompletedlabel.Location     = New-Object System.Drawing.Point(100,40)
$uploadcompleted.Controls.Add($uploadcompletedlabel)

#####################################################################################################
#downloadcompleted pagina
$downloadcompleted                 = New-Object System.Windows.Forms.Form
$downloadcompleted.ClientSize      = New-Object System.Drawing.Point(400,150)
$downloadcompleted.Text            = "Download Completed"
$downloadcompleted.TopMost         = $true
$downloadcompleted.StartPosition   = "CenterScreen"
$downloadcompleted.FormBorderStyle = 'Fixed3D'
$downloadcompleted.MaximizeBox     = $false

$downloadcompletedlbl              = New-Object -TypeName System.Windows.Forms.Label
$downloadcompletedlbl.Text         = 'Het bestand is gedownload naar je lokale Downloads map! Je kan nu dit script sluiten door op sluiten te klikken!'
$downloadcompletedlbl.AutoSize     = $false
$downloadcompletedlbl.Width        = 350
$downloadcompletedlbl.Height       = 60
$downloadcompletedlbl.Font         = $font
$downloadcompletedlbl.Location     = New-Object System.Drawing.Point(10,10)
$downloadcompleted.Controls.Add($downloadcompletedlbl)

#Button om het hele script te sluiten
$scriptclosebutton                  = New-Object System.Windows.Forms.Button
$scriptclosebutton.Text             = "Sluiten"
$scriptclosebutton.Width            = 100
$scriptclosebutton.Height           = 50
$scriptclosebutton.Location         = New-Object System.Drawing.Point(290,90)
$scriptclosebutton.Font             = $font
$downloadcompleted.Controls.Add($scriptclosebutton)
$scriptclosebutton.Add_Click({
Remove-Item "C:\ffmpeg files\downloads\*.*"
Remove-Item "C:\ffmpeg files\upload\*.*"
Remove-Item "C:\ffmpeg files\upload 2\*.*"
$Page1.Dispose()
$Page2.Dispose()
$Page3.Dispose()
$Page3_1.Dispose()
$Page3_2.Dispose()
$Page3_3.Dispose()
$Page4.Dispose()
$Page5.Dispose()
$Page6.Dispose()
})

#####################################################################################################
#Pagina 6: H264 pagina
$Page6                             = New-Object System.Windows.Forms.Form
$Page6.ClientSize                  = New-Object System.Drawing.Point($screensize)
$Page6.StartPosition               = "CenterScreen"
$Page6.MaximizeBox                 = $false
$Page6.FormBorderStyle             = 'Fixed3D'
$Page6.ShowIcon                    = $false
$Page6.Text                        = "Bestandsomzetter | Pagina 6 | Conversie H264"
$Page6.TopMost                     = $false

#Label om te vragen om te uploaden
$uploadvraaglabel                  = New-Object System.Windows.Forms.Label
$uploadvraaglabel.Text             = "Klik hieronder om je videobestand te uploaden."
$uploadvraaglabel.AutoSize         = $false
$uploadvraaglabel.Width            = 400
$uploadvraaglabel.Height           = 100
$uploadvraaglabel.Location         = New-Object System.Drawing.Point(90,80)
$uploadvraaglabel.Font             = $font
$Page6.Controls.Add($uploadvraaglabel)

#Button om het videobestand te browsen
$vid6browsebutton                  = New-Object System.Windows.Forms.Button
$vid6browsebutton.Text             = "Videobestand browsen"
$vid6browsebutton.Width            = 100
$vid6browsebutton.Height           = 50
$vid6browsebutton.Location         = New-Object System.Drawing.Point(300,200)
$vid6browsebutton.Font             = $font
$Page6.Controls.Add($vid6browsebutton)
$vid6browsebutton.Add_Click({
$browsevid.ShowDialog()
})

#Button om het videobestand te uploaden
$vid6uploadbutton                  = New-Object System.Windows.Forms.Button
$vid6uploadbutton.Text             = "Video Uploaden"
$vid6uploadbutton.Width            = 100
$vid6uploadbutton.Height           = 50
$vid6uploadbutton.Location         = New-Object System.Drawing.Point(450,200)
$vid6uploadbutton.Font             = $font
$Page6.Controls.Add($vid6uploadbutton)
$vid6uploadbutton.Add_Click({
Copy-Item -Path $browsevid.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om de bewerking te starten
$start6                            = New-Object System.Windows.Forms.Button
$start6.Text                       = "Start bewerking"
$start6.Width                      = 100
$start6.Height                     = 50
$start6.Location                   = New-Object System.Drawing.Point(660,250)
$start6.Font                       = $font
$Page6.Controls.Add($start6)
$start6.Add_Click({
$output6 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "H264"
function ffmpeg6 {
ffmpeg.exe -i $browsevid.FileName -c:v libx264 -preset medium -crf 10 -c:a copy "$output6.mp4"
}
ffmpeg6
})

#Button om het eindbestand te downloaden
$vid6downloadbutton                = New-Object System.Windows.Forms.Button
$vid6downloadbutton.Text           = "Video Downloaden"
$vid6downloadbutton.Width          = 150
$vid6downloadbutton.Height         = 100
$vid6downloadbutton.Location       = New-Object System.Drawing.Point(325,380)
$vid6downloadbutton.Font           = $font
$Page6.Controls.Add($vid6downloadbutton)
$vid6downloadbutton.Add_Click({
$outputdownload6 = "$outputdir" + "\" + "$naam" + "_" + "$date" + "_" + "H264"
Copy-Item -Path "$outputdownload6.mp4" -Destination $StandaardDirectory
$downloadcompleted.ShowDialog()
})

#####################################################################################################
#Pagina 5: Audio pagina
$Page5                             = New-Object System.Windows.Forms.Form
$Page5.ClientSize                  = New-Object System.Drawing.Point($screensize)
$Page5.StartPosition               = "CenterScreen"
$Page5.MaximizeBox                 = $false
$Page5.FormBorderStyle             = 'Fixed3D'
$Page5.ShowIcon                    = $false
$Page5.Text                        = "Bestandsomzetter | Pagina 5 | Audio toevoegen"
$Page5.TopMost                     = $false

#Label om te vragen om te uploaden
$uploadvraagaudiolabel             = New-Object System.Windows.Forms.Label
$uploadvraagaudiolabel.Text        = "Klik hieronder om je videobestand en audiobestand te uploaden."
$uploadvraagaudiolabel.AutoSize    = $false
$uploadvraagaudiolabel.Width       = 400
$uploadvraagaudiolabel.Height      = 100
$uploadvraagaudiolabel.Location    = New-Object System.Drawing.Point(100,100)
$uploadvraagaudiolabel.Font        = $font
$Page5.Controls.Add($uploadvraagaudiolabel)

#Button om het audiobestand te browsen
$audiobrowsebutton                 = New-Object System.Windows.Forms.Button
$audiobrowsebutton.Text            = "Audio browsen"
$audiobrowsebutton.Width           = 100
$audiobrowsebutton.Height          = 50
$audiobrowsebutton.Location        = New-Object System.Drawing.Point(250,200)
$audiobrowsebutton.Font            = $font
$Page5.Controls.Add($audiobrowsebutton)
$audiobrowsebutton.Add_Click({
$browseaud.ShowDialog()
})

#Button om het audiobestand te uploaden
$au5uploadbutton                   = New-Object System.Windows.Forms.Button
$au5uploadbutton.Text              = "Audio uploaden"
$au5uploadbutton.Width             = 100
$au5uploadbutton.Height            = 50
$au5uploadbutton.Location          = New-Object System.Drawing.Point(450,200)
$au5uploadbutton.Font              = $font
$Page5.Controls.Add($au5uploadbutton)
$au5uploadbutton.Add_Click({
#Uploaden van het bestand naar de destination
Copy-Item -Path $browseaud.FileName -Destination $destinationvid2
$uploadcompleted.ShowDialog()
})

#Button om het videobestand te browsen
$vid5browsebutton                  = New-Object System.Windows.Forms.Button
$vid5browsebutton.Text             = "Video browsen"
$vid5browsebutton.Width            = 100
$vid5browsebutton.Height           = 50
$vid5browsebutton.Location         = New-Object System.Drawing.Point(250,300)
$vid5browsebutton.Font             = $font
$Page5.Controls.Add($vid5browsebutton)
$vid5browsebutton.Add_Click({
$browsevid.ShowDialog()
})

#Button om het videobestand te uploaden
$vid5uploadbutton                  = New-Object System.Windows.Forms.Button
$vid5uploadbutton.Text             = "Video Uploaden"
$vid5uploadbutton.Width            = 100
$vid5uploadbutton.Height           = 50
$vid5uploadbutton.Location         = New-Object System.Drawing.Point(450,300)
$vid5uploadbutton.Font             = $font
$Page5.Controls.Add($vid5uploadbutton)
$vid5uploadbutton.Add_Click({
#Uploaden van het bestand naar de destination
Copy-Item -Path $browsevid.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om de bewerking te starten
$start5                            = New-Object System.Windows.Forms.Button
$start5.Text                       = "Start bewerking"
$start5.Width                      = 100
$start5.Height                     = 50
$start5.Location                   = New-Object System.Drawing.Point(660,250)
$start5.Font                       = $font
$Page5.Controls.Add($start5)
$start5.Add_Click({
$output5 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "audio"
function ffmpeg5 {
ffmpeg.exe -i $browsevid.FileName -i $browseaud.FileName -c:v copy -c:a mp3 -map 0:v:0 -map 0:a:0 "$output5.mp4"
}
ffmpeg5
})

#Button om het eindbestand te downloaden
$vid5downloadbutton                = New-Object System.Windows.Forms.Button
$vid5downloadbutton.Text           = "Video Downloaden"
$vid5downloadbutton.Width          = 150
$vid5downloadbutton.Height         = 100
$vid5downloadbutton.Location       = New-Object System.Drawing.Point(300,450)
$vid5downloadbutton.Font           = $font
$Page5.Controls.Add($vid5downloadbutton)
$vid5downloadbutton.Add_Click({
$outputdownload5 = "$outputdir" + "\" + "$naam" + "_" + "$date" + "_" + "audio"
Copy-Item -Path "$outputdownload5.mp4" -Destination $StandaardDirectory
$downloadcompleted.ShowDialog()
})

#####################################################################################################
#Pagina 4: logo pagina
$Page4                             = New-Object System.Windows.Forms.Form
$Page4.ClientSize                  = New-Object System.Drawing.Point($screensize)
$Page4.StartPosition               = "CenterScreen"
$Page4.MaximizeBox                 = $false
$Page4.FormBorderStyle             = 'Fixed3D'
$Page4.ShowIcon                    = $false
$Page4.Text                        = "Bestandsomzetter | Pagina 4 | Logo toevoegen"
$Page4.TopMost                     = $false

#Label om te vragen om te uploaden
$uploadvraaglogolabel              = New-Object System.Windows.Forms.Label
$uploadvraaglogolabel.Text         = "Klik hieronder om je videobestand en logo te uploaden."
$uploadvraaglogolabel.AutoSize     = $false
$uploadvraaglogolabel.Width        = 400
$uploadvraaglogolabel.Height       = 100
$uploadvraaglogolabel.Location     = New-Object System.Drawing.Point(100,100)
$uploadvraaglogolabel.Font         = $font
$Page4.Controls.Add($uploadvraaglogolabel)

#Button om het logobestand te browsen
$logobrowsebutton                  = New-Object System.Windows.Forms.Button
$logobrowsebutton.Text             = "Logo browsen"
$logobrowsebutton.Width            = 100
$logobrowsebutton.Height           = 50
$logobrowsebutton.Location         = New-Object System.Drawing.Point(250,200)
$logobrowsebutton.Font             = $font
$Page4.Controls.Add($logobrowsebutton)
$logobrowsebutton.Add_Click({
$browselogo.ShowDialog()
})

#Button om het logobestand te uploaden
$logouploadbutton                  = New-Object System.Windows.Forms.Button
$logouploadbutton.Text             = "Logo uploaden"
$logouploadbutton.Width            = 100
$logouploadbutton.Height           = 50
$logouploadbutton.Location         = New-Object System.Drawing.Point(400,200)
$logouploadbutton.Font             = $font
$Page4.Controls.Add($logouploadbutton)
$logouploadbutton.Add_Click({
Copy-Item -Path $browselogo.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om het videobestand te browsen
$vid4browsebutton                  = New-Object System.Windows.Forms.Button
$vid4browsebutton.Text             = "Videobestand browsen"
$vid4browsebutton.Width            = 100
$vid4browsebutton.Height           = 50
$vid4browsebutton.Location         = New-Object System.Drawing.Point(250,300)
$vid4browsebutton.Font             = $font
$Page4.Controls.Add($vid4browsebutton)
$vid4browsebutton.Add_Click({
$browsevid.ShowDialog()
})

#Button om het videobestand te uploaden
$vid4uploadbutton                  = New-Object System.Windows.Forms.Button
$vid4uploadbutton.Text             = "Video Uploaden"
$vid4uploadbutton.Width            = 100
$vid4uploadbutton.Height           = 50
$vid4uploadbutton.Location         = New-Object System.Drawing.Point(400,300)
$vid4uploadbutton.Font             = $font
$Page4.Controls.Add($vid4uploadbutton)
$vid4uploadbutton.Add_Click({
Copy-Item -Path $browsevid.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om de bewerking te starten
$start4                            = New-Object System.Windows.Forms.Button
$start4.Text                       = "Start bewerking"
$start4.Width                      = 100
$start4.Height                     = 50
$start4.Location                   = New-Object System.Drawing.Point(660,250)
$start4.Font                       = $font
$Page4.Controls.Add($start4)
$start4.Add_Click({
$output4 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "logo"
function ffmpeg4 {
ffmpeg.exe -i $browsevid.FileName -i $browselogo.FileName -filter_complex "overlay='if(gte(t,1), -w+(t-1)*200, NAN)':(720-474)/2" "$output4.mp4"
}
ffmpeg4
})

#Button om het eindbestand te downloaden
$vid4downloadbutton                = New-Object System.Windows.Forms.Button
$vid4downloadbutton.Text           = "Video Downloaden"
$vid4downloadbutton.Width          = 150
$vid4downloadbutton.Height         = 100
$vid4downloadbutton.Location       = New-Object System.Drawing.Point(350,450)
$vid4downloadbutton.Font           = $font
$Page4.Controls.Add($vid4downloadbutton)
$vid4downloadbutton.Add_Click({
$outputdownload4 = "$outputdir" + "\" + "$naam" + "_" + "$date" + "_" + "logo"
Copy-Item -Path "$outputdownload4.mp4" -Destination $StandaardDirectory
$downloadcompleted.ShowDialog()
})

#####################################################################################################
#Pagina 3.3: 720p pagina
$Page3_3                           = New-Object System.Windows.Forms.Form
$Page3_3.ClientSize                = New-Object System.Drawing.Point($screensize)
$Page3_3.StartPosition             = "CenterScreen"
$Page3_3.MaximizeBox               = $false
$Page3_3.FormBorderStyle           = 'Fixed3D'
$Page3_3.ShowIcon                  = $false
$Page3_3.Text                      = "Bestandsomzetter | Pagina 3.3 | 720p"
$Page3_3.TopMost                   = $false

#Label om te vragen voor de resolutie
$uploadvraag720label               = New-Object System.Windows.Forms.Label
$uploadvraag720label.Text          = "Klik hieronder om je bestand te uploaden."
$uploadvraag720label.AutoSize      = $false
$uploadvraag720label.Width         = 400
$uploadvraag720label.Height        = 100
$uploadvraag720label.Location      = New-Object System.Drawing.Point(100,100)
$uploadvraag720label.Font          = $font
$Page3_3.Controls.Add($uploadvraag720label)

#Button om het bestand te browsen
$vid3_3browsebutton                = New-Object System.Windows.Forms.Button
$vid3_3browsebutton.Text           = "Video browsen"
$vid3_3browsebutton.Width          = 100
$vid3_3browsebutton.Height         = 50
$vid3_3browsebutton.Location       = New-Object System.Drawing.Point(250,200)
$vid3_3browsebutton.Font           = $font
$Page3_3.Controls.Add($vid3_3browsebutton)
$vid3_3browsebutton.Add_Click({
$browsevid.ShowDialog()
})

#Button om het videobestand te uploaden
$vid3_3uploadbutton                = New-Object System.Windows.Forms.Button
$vid3_3uploadbutton.Text           = "Video uploaden"
$vid3_3uploadbutton.Width          = 100
$vid3_3uploadbutton.Height         = 50
$vid3_3uploadbutton.Location       = New-Object System.Drawing.Point(400,200)
$vid3_3uploadbutton.Font           = $font
$Page3_3.Controls.Add($vid3_3uploadbutton)
$vid3_3uploadbutton.Add_Click({
Copy-Item -Path $browsevid.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om de bewerking te starten
$start3_3                            = New-Object System.Windows.Forms.Button
$start3_3.Text                       = "Start bewerking"
$start3_3.Width                      = 100
$start3_3.Height                     = 50
$start3_3.Location                   = New-Object System.Drawing.Point(660,250)
$start3_3.Font                       = $font
$Page3_3.Controls.Add($start3_3)
$start3_3.Add_Click({
$output3_3 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "720p"
function ffmpeg3_3 {
ffmpeg.exe -i $browsevid.FileName -vf scale=-1:720 "$output3_3.mp4"
}
ffmpeg3_3
})

#Button om het eindbestand te downloaden
$vid3_3downloadbutton              = New-Object System.Windows.Forms.Button
$vid3_3downloadbutton.Text         = "Video Downloaden"
$vid3_3downloadbutton.Width        = 150
$vid3_3downloadbutton.Height       = 100
$vid3_3downloadbutton.Location     = New-Object System.Drawing.Point(350,300)
$vid3_3downloadbutton.Font         = $font
$Page3_3.Controls.Add($vid3_3downloadbutton)
$vid3_3downloadbutton.Add_Click({
$outputdownload3_3 = "$outputdir" + "\" + "$naam" + "_" + "$date" + "_" + "720p"
Copy-Item -Path "$outputdownload3_3.mp4" -Destination $StandaardDirectory
$downloadcompleted.ShowDialog()
})

#####################################################################################################
#Pagina 3.2: 1080p pagina
$Page3_2                           = New-Object System.Windows.Forms.Form
$Page3_2.ClientSize                = New-Object System.Drawing.Point($screensize)
$Page3_2.StartPosition             = "CenterScreen"
$Page3_2.MaximizeBox               = $false
$Page3_2.FormBorderStyle           = 'Fixed3D'
$Page3_2.ShowIcon                  = $false
$Page3_2.Text                      = "Bestandsomzetter | Pagina 3.2 | 1080p"
$Page3_2.TopMost                   = $false

#Label om te vragen voor de resolutie
$uploadvraag1080label              = New-Object System.Windows.Forms.Label
$uploadvraag1080label.Text         = "Klik hieronder om je bestand te uploaden."
$uploadvraag1080label.AutoSize     = $false
$uploadvraag1080label.Width        = 400
$uploadvraag1080label.Height       = 100
$uploadvraag1080label.Location     = New-Object System.Drawing.Point(100,100)
$uploadvraag1080label.Font         = $font
$Page3_2.Controls.Add($uploadvraag1080label)

#Button om het bestand te uploaden
$vid3_2browsebutton                = New-Object System.Windows.Forms.Button
$vid3_2browsebutton.Text           = "Video browsen"
$vid3_2browsebutton.Width          = 100
$vid3_2browsebutton.Height         = 50
$vid3_2browsebutton.Location       = New-Object System.Drawing.Point(250,200)
$vid3_2browsebutton.Font           = $font
$Page3_2.Controls.Add($vid3_2browsebutton)
$vid3_2browsebutton.Add_Click({
$browsevid.ShowDialog()
})

#Button om het logobestand te uploaden
$vid3_2uploadbutton                = New-Object System.Windows.Forms.Button
$vid3_2uploadbutton.Text           = "Logo uploaden"
$vid3_2uploadbutton.Width          = 100
$vid3_2uploadbutton.Height         = 50
$vid3_2uploadbutton.Location       = New-Object System.Drawing.Point(400,200)
$vid3_2uploadbutton.Font           = $font
$Page3_2.Controls.Add($vid3_2uploadbutton)
$vid3_2uploadbutton.Add_Click({
Copy-Item -Path $browsevid.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om de bewerking te starten
$start3_2                            = New-Object System.Windows.Forms.Button
$start3_2.Text                       = "Start bewerking"
$start3_2.Width                      = 100
$start3_2.Height                     = 50
$start3_2.Location                   = New-Object System.Drawing.Point(660,250)
$start3_2.Font                       = $font
$Page3_2.Controls.Add($start3_2)
$start3_2.Add_Click({
$output3_2 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "1080p"
function ffmpeg3_2 {
ffmpeg.exe -i $browsevid.FileName -vf scale=-1:1080 "$output3_2.mp4"
}
ffmpeg3_2
})

#Button om het eindbestand te downloaden
$vid3_2downloadbutton              = New-Object System.Windows.Forms.Button
$vid3_2downloadbutton.Text         = "Video Downloaden"
$vid3_2downloadbutton.Width        = 150
$vid3_2downloadbutton.Height       = 100
$vid3_2downloadbutton.Location     = New-Object System.Drawing.Point(350,300)
$vid3_2downloadbutton.Font         = $font
$Page3_2.Controls.Add($vid3_2downloadbutton)
$vid3_2downloadbutton.Add_Click({
$outputdownload3_2 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "1080p"
Copy-Item -Path "$outputdownload3_2.mp4" -Destination $StandaardDirectory
$downloadcompleted.ShowDialog()
})

#####################################################################################################
#Pagina 3.1: 1280p pagina
$Page3_1                           = New-Object System.Windows.Forms.Form
$Page3_1.ClientSize                = New-Object System.Drawing.Point($screensize)
$Page3_1.StartPosition             = "CenterScreen"
$Page3_1.MaximizeBox               = $false
$Page3_1.FormBorderStyle           = 'Fixed3D'
$Page3_1.ShowIcon                  = $false
$Page3_1.Text                      = "Bestandsomzetter | Pagina 3.1 | 1280p"
$Page3_1.TopMost                   = $false

#Label om te vragen voor de resolutie
$uploadvraag1280label              = New-Object System.Windows.Forms.Label
$uploadvraag1280label.Text         = "Klik hieronder om je bestand te uploaden."
$uploadvraag1280label.AutoSize     = $false
$uploadvraag1280label.Width        = 400
$uploadvraag1280label.Height       = 100
$uploadvraag1280label.Location     = New-Object System.Drawing.Point(100,100)
$uploadvraag1280label.Font         = $font
$Page3_1.Controls.Add($uploadvraag1280label)

#Button om het bestand te uploaden
$vid3_1browsebutton                = New-Object System.Windows.Forms.Button
$vid3_1browsebutton.Text           = "Video Browsen"
$vid3_1browsebutton.Width          = 100
$vid3_1browsebutton.Height         = 50
$vid3_1browsebutton.Location       = New-Object System.Drawing.Point(250,200)
$vid3_1browsebutton.Font           = $font
$Page3_1.Controls.Add($vid3_1browsebutton)
$vid3_1browsebutton.Add_Click({
$browsevid.ShowDialog()
})

#Button om het logobestand te uploaden
$vid3_1uploadbutton                = New-Object System.Windows.Forms.Button
$vid3_1uploadbutton.Text           = "Video uploaden"
$vid3_1uploadbutton.Width          = 100
$vid3_1uploadbutton.Height         = 50
$vid3_1uploadbutton.Location       = New-Object System.Drawing.Point(400,200)
$vid3_1uploadbutton.Font           = $font
$Page3_1.Controls.Add($vid3_1uploadbutton)
$vid3_1uploadbutton.Add_Click({
Copy-Item -Path $browsevid.FileName -Destination $destinationvid
$uploadcompleted.ShowDialog()
})

#Button om de bewerking te starten
$start3_1                            = New-Object System.Windows.Forms.Button
$start3_1.Text                       = "Start bewerking"
$start3_1.Width                      = 100
$start3_1.Height                     = 50
$start3_1.Location                   = New-Object System.Drawing.Point(660,250)
$start3_1.Font                       = $font
$Page3_1.Controls.Add($start3_1)
$start3_1.Add_Click({
$output3_1 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "1280p"
function ffmpeg3_1 {
ffmpeg.exe -i $browsevid.FileName -vf scale=-1:1280 "$output3_1.mp4"
}
ffmpeg3_1
})

#Button om het eindbestand te downloaden
$vid3_1downloadbutton              = New-Object System.Windows.Forms.Button
$vid3_1downloadbutton.Text         = "Video Downloaden"
$vid3_1downloadbutton.Width        = 150
$vid3_1downloadbutton.Height       = 100
$vid3_1downloadbutton.Location     = New-Object System.Drawing.Point(350,300)
$vid3_1downloadbutton.Font         = $font
$Page3_1.Controls.Add($vid3_1downloadbutton)
$vid3_1downloadbutton.Add_Click({
$outputdownload3_1 = "$outputdir" + "$naam" + "_" + "$date" + "_" + "1280p"
Copy-Item -Path "$outputdownload3_1.mp4" -Destination $StandaardDirectory
$downloadcompleted.ShowDialog()
})

#####################################################################################################
#Pagina 3: Resolutiekeuze
$Page3                             = New-Object System.Windows.Forms.Form
$Page3.ClientSize                  = New-Object System.Drawing.Point($screensize)
$Page3.StartPosition               = "CenterScreen"
$Page3.MaximizeBox                 = $false
$Page3.FormBorderStyle             = 'Fixed3D'
$Page3.ShowIcon                    = $false
$Page3.Text                        = "Bestandsomzetter | Pagina 3 | Resolutie keuze"
$Page3.TopMost                     = $false

#Label om te vragen voor de resolutie
$resolutiekeuzelabel               = New-Object System.Windows.Forms.Label
$resolutiekeuzelabel.Text          = "Naar welke resolutie moet de video geconverteerd worden?"
$resolutiekeuzelabel.AutoSize      = $false
$resolutiekeuzelabel.Width         = 400
$resolutiekeuzelabel.Height        = 100
$resolutiekeuzelabel.Location      = New-Object System.Drawing.Point(100,100)
$resolutiekeuzelabel.Font          = $font
$Page3.Controls.Add($resolutiekeuzelabel)

#Button naar 1280p pagina
$1280button                        = New-Object System.Windows.Forms.Button
$1280button.Text                   = "1280p"
$1280button.Width                  = 100
$1280button.Height                 = 50
$1280button.Location               = New-Object System.Drawing.Point(100,300)
$1280button.Font                   = $font
$Page3.Controls.Add($1280button)
$1280button.Add_Click({
$Page3.Close()
$Page3_1.ShowDialog()
})

#Button naar 1080p pagina
$1080button                        = New-Object System.Windows.Forms.Button
$1080button.Text                   = "1080p"
$1080button.Width                  = 100
$1080button.Height                 = 50
$1080button.Location               = New-Object System.Drawing.Point(250,300)
$1080button.Font                   = $font
$Page3.Controls.Add($1080button)
$1080button.Add_Click({
$Page3.Close()
$Page3_2.ShowDialog()
})

#Button naar 720p pagina
$720button                         = New-Object System.Windows.Forms.Button
$720button.Text                    = "720p"
$720button.Width                   = 100
$720button.Height                  = 50
$720button.Location                = New-Object System.Drawing.Point(400,300)
$720button.Font                    = $font
$Page3.Controls.Add($720button)
$720button.Add_Click({
$Page3.Close()
$Page3_3.ShowDialog()
})

#####################################################################################################
#Pagina 2: Keuze maken voor het transcoderen
$Page2                             = New-Object System.Windows.Forms.Form
$Page2.ClientSize                  = New-Object System.Drawing.Point($screensize)
$Page2.StartPosition               = "CenterScreen"
$Page2.MaximizeBox                 = $false
$Page2.FormBorderStyle             = 'Fixed3D'
$Page2.ShowIcon                    = $false
$Page2.Text                        = "Bestandsomzetter | Pagina 2 | keuze van transcoderen"
$Page2.TopMost                     = $false

#Label om te vragen wat de gebruiker wilt doen
$KeuzeLabel                        = New-Object System.Windows.Forms.Label
$KeuzeLabel.Text                   = "Wat wilt u doen?"
$KeuzeLabel.AutoSize               = $false
$KeuzeLabel.Width                  = 400
$KeuzeLabel.Height                 = 100
$KeuzeLabel.Location               = New-Object System.Drawing.Point(100,100)
$KeuzeLabel.Font                   = $font
$Page2.Controls.Add($KeuzeLabel)

#Knop om conversie te kiezen
$conversie                         = New-Object System.Windows.Forms.Button
$conversie.Text                    = "Conversie naar H264"
$conversie.Width                   = 100
$conversie.Height                  = 50
$conversie.Location                = New-Object System.Drawing.Point(100,300)
$conversie.Font                    = $font
$Page2.Controls.Add($conversie)
$conversie.Add_Click({
$Page2.Close()
$Page6.ShowDialog()
})

#Knop om audio te kiezen
$audio                             = New-Object System.Windows.Forms.Button
$audio.Text                        = "Audio toevoegen"
$audio.Width                       = 100
$audio.Height                      = 50
$audio.Location                    = New-Object System.Drawing.Point(250,300)
$audio.Font                        = $font
$Page2.Controls.Add($audio)
$audio.Add_Click({
$Page2.Close()
$Page5.ShowDialog()
})

#Knop om logo te kiezen
$logo                              = New-Object System.Windows.Forms.Button
$logo.Text                         = "Logo toevoegen"
$logo.Width                        = 100
$logo.Height                       = 50
$logo.Location                     = New-Object System.Drawing.Point(400,300)
$logo.Font                         = $font
$Page2.Controls.Add($logo)
$logo.Add_Click({
$Page2.Close()
$Page4.ShowDialog()
})

#Knop om resolutie te kiezen
$resolutie                         = New-Object System.Windows.Forms.Button
$resolutie.Text                    = "Resolutie veranderen"
$resolutie.Width                   = 100
$resolutie.Height                  = 50
$resolutie.Location                = New-Object System.Drawing.Point(550,300)
$resolutie.Font                    = $font
$Page2.Controls.Add($resolutie)
$resolutie.Add_Click({
$Page2.Close()
$Page3.ShowDialog()
})

#####################################################################################################
#Pagina 1: Naam vragen
$Page1                             = New-Object System.Windows.Forms.Form
$Page1.Size                        = New-Object System.Drawing.Size($screensize)
$Page1.ClientSize                  = New-Object System.Drawing.Point($screensize)
$Page1.StartPosition               = "CenterScreen"
$Page1.MaximizeBox                 = $false
$Page1.FormBorderStyle             = 'Fixed3D'
$Page1.text                        = "Bestandsomzetter | Pagina 1 | NaamPagina"
$Page1.TopMost                     = $false

#Vragen naar de naam van de gebruiker
$TextNaamVraag                     = New-Object System.Windows.Forms.Label
$TextNaamVraag.Text                = "Voer hieronder uw naam in."
$TextNaamVraag.AutoSize            = $false
$TextNaamVraag.Width               = 400
$TextNaamVraag.Height              = 100
$TextNaamVraag.Location            = New-Object System.Drawing.Point(100,100)
$TextNaamVraag.Font                = $font
$Page1.Controls.Add($TextNaamVraag)

#De inputbox om de naam in te voeren
$Naaminputbox                      = New-Object System.Windows.Forms.TextBox
$Naaminputbox.Text                 = $defaultnaam
$Naaminputbox.Multiline            = $false
$Naaminputbox.Width                = 200
$Naaminputbox.Height               = 20
$Naaminputbox.Location             = New-Object System.Drawing.Point(200,300)
$Naaminputbox.Font                 = $font
$Page1.Controls.Add($Naaminputbox)

#Knop om verder te gaan naar pagina 2 (keuze wat de gebruiker wilt doen), dit slaat ook de naam op in een variable($naam)
$VerderButton1                     = New-Object System.Windows.Forms.Button
$VerderButton1.Text                = "Volgende"
$VerderButton1.Width               = 100
$VerderButton1.Height              = 50
$VerderButton1.Location            = New-Object System.Drawing.Point(650,500)
$VerderButton1.Font                = $font
$Page1.Controls.Add($VerderButton1)
$VerderButton1.Add_Click({
[System.EventHandler]{
$Naaminputbox.Text}
$Page1.Close()
$Page2.ShowDialog()
})
#Starten van de form.
$Page1.ShowDialog()

#####################################################################################################
#Variable aanmaken waar de naam in opgeslagen wordt - Aan het eind van het script houden!!
$naam = $Naaminputbox.Text

#TIJDELIJK voor testen en onthouden van variable
$naam