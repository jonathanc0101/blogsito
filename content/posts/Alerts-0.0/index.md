+++
date = '2025-12-02T21:56:17-03:00'
draft = false
title = 'Alerts 0.0'
tags = ["alerts"]
+++


<style>
    /* Fondo general oscuro de la página de alerts */
body {
  background-color: #020617; /* slate-950 */
}

/* Contenedor principal con spotlight */
.page-spotlight {
  position: relative;
  min-height: 100vh;
  color: #e5e7eb;
}

/* Capa oscura con agujero circular alrededor del cursor / centro */
.page-spotlight::before {
  content: "";
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 2;

  /* valores iniciales del círculo */
  --spot-x: 50vw;
  --spot-y: 40vh;

  background:
    radial-gradient(
      circle at var(--spot-x) var(--spot-y),
      transparent 0,
      transparent 140px,
      rgba(0,0,0,0.96) 260px
    );
}

/* Aseguramos que el contenido quede por encima del overlay */
.page-spotlight > * {
  position: relative;
  z-index: 1;
}

</style>

<div class="page-spotlight">

<div class="alert alert--sweet">
<div class="alert__icon">?</div>
<p class="alert__text">¿Te mentís?</p>
<div class="alert__actions">
    <button class="alert__btn">no</button>
    <button class="alert__btn alert__btn--secondary">ni a palos</button>
</div>
</div>


<!-- INFO (Bootstrap-ish) -->
<div class="alert alert--info">
<div class="alert__icon">ℹ️</div>
<p class="alert__text">Por algo se fue</p>
<div class="alert__actions">
    <button class="alert__btn alert__btn--primary">ok</button>
</div>
</div>

<!-- RELOJ (Material Design) -->
<div class="alert alert--material">
<p class="alert__text">Es hora de ver otro amanecer</p>
<div class="alert__actions">
    <button class="alert__btn alert__btn--md">ok</button>
</div>
</div>

<!-- ERROR (Windows 98 / glitch) -->
<div class="alert alert--error">
<br>
<p class="alert__text">Respiración automática desactivada</p>
<div class="alert__actions">
    <button class="alert__btn alert__btn--error">Reactivar</button>
</div>
</div>

<!-- SUCCESS (SweetAlert2 vibes) -->
<div class="alert alert--sweet">
<div class="alert__icon">✔</div>
<p class="alert__text">Ya estás aceptando</p>
<div class="alert__actions">
    <button class="alert__btn">ok</button>
</div>
</div>


<div class="alert alert--sweet">
<div class="alert__icon">i</div>
<p class="alert__text">Todos nos mentimos</p>
</div>

</div>

