$imagenUrl = "https://avatars.githubusercontent.com/u/76418657?v=4"  # URL de la imagen de fondo que deseas establecer

# Define la ruta local donde se guardará la imagen descargada en la carpeta "Documentos" del usuario actual
$rutaLocal = "$([Environment]::GetFolderPath('MyDocuments'))\imagen.jpg"

# Descarga la imagen desde la URL especificada
Invoke-WebRequest -Uri $imagenUrl -OutFile $rutaLocal

# Define la ruta del Registro de Windows que controla el fondo de pantalla
$rutaRegistro = "HKCU:\Control Panel\Desktop"

# Establece el valor del Registro para cambiar el fondo de pantalla
Set-ItemProperty -Path $rutaRegistro -Name Wallpaper -Value $rutaLocal

# Actualiza la configuración del fondo de pantalla
rundll32.exe user32.dll,UpdatePerUserSystemParameters
