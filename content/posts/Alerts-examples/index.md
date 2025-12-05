+++
date = '2025-12-03T20:21:45-03:00'
draft = true
title = 'Alerts Examples'
tags = ["alerts"]
+++


{{< dialog
  variant="material"
  icon="🐕"
  title="Atención al llamado"
  primary_label="Leer más"
  primary_href="/posts/llamado/"
>}}
Cuando un perro no te presta atención, lo primero que se rompe es el llamado.
{{< /dialog >}}

<!--more-->

{{< dialog
  variant="win98"
  icon="⚠️"
  title="Error crítico"
  primary_label="Aceptar"
  primary_href="#ok"
  secondary_label="Cancelar"
  secondary_href="#cancel"
>}}
Se ha producido un error en la aplicación *Refugio.exe*.
{{< /dialog >}}

{{< dialog
  variant="win7"
  icon="💾"
  title="Guardar cambios"
  primary_label="Guardar"
  primary_href="#save"
  secondary_label="No guardar"
  secondary_href="#discard"
>}}
¿Deseas guardar los cambios antes de salir?
{{< /dialog >}}


{{< dialog
  variant="chakra"
  icon="🌱"
  title="Nuevo hábito"
  primary_label="Empezar"
  primary_href="#start"
>}}
Este es un dialog con vibra más “Chakra UI”: limpio, soft, espacioso.
{{< /dialog >}}


{{< dialog
  variant="chakra"
  title="Probá los botones"
  icon="🧪"
  buttons=`[
    { "label": "Ir al inicio", "action": "link", "kind": "primary", "href": "/" },
    { "label": "Bajar", "action": "scroll", "target": "#arriba", "icon": "⬇️" },
    { "label": "Subir", "action": "scroll", "target": "#abajo", "icon": "⬆️" },
    { "label": "Copiar código", "action": "copy", "text": "TOKEN-XYZ", "icon": "📋" },
    { "label": "Alertar", "action": "custom", "handler": "alertar", "icon": "⚡" }
  ]`
>}}
Esto permite un componente muchísimo más flexible.
{{< /dialog >}}


{{< dialog
  variant="win98"
  icon="🧬"
  title="Glitch de realidad"
  buttons=`[
    { "label": "Glitchear todo", "action": "custom", "kind": "primary", "handler": "glitchear", "icon": "⚡" }
  ]`
>}}
Al apretar este botón, el sitio titila y se rompe por un instante.
{{< /dialog >}}
