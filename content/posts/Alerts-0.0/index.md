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

/* Definimos las variables a nivel root (o podrían ir en .page-spotlight) */
:root {
  --spot-x: 50vw;
  --spot-y: 40vh;
}

/* Capa oscura con agujero circular alrededor del cursor / centro */
.page-spotlight::before {
  content: "";
  position: fixed;
  inset: 0;
  pointer-events: none;
  z-index: 2;

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

<script>
  (function () {
    const root = document.documentElement;

    let scrollEnabled = true;

    // posición actual del foco
    let spotX = window.innerWidth / 2;
    let spotY = window.innerHeight * 0.4;

    // posición objetivo del foco
    let targetX = spotX;
    let targetY = spotY;

    function setSpot(x, y) {
      root.style.setProperty("--spot-x", x + "px");
      root.style.setProperty("--spot-y", y + "px");
    }

    // loop de animación con easing
    function animate() {
      const ease = 0.25; // 0.1 = más lento, 0.4 = más rápido

      spotX += (targetX - spotX) * ease;
      spotY += (targetY - spotY) * ease;

      setSpot(spotX, spotY);

      requestAnimationFrame(animate);
    }

    // arranca el loop
    requestAnimationFrame(animate);

    // Desktop: seguir el mouse (pero usando targetX/targetY)
    window.addEventListener("mousemove", function (e) {
      scrollEnabled = false;
      targetX = e.clientX;
      targetY = e.clientY;
    });

    // Mobile: seguir el dedo
    window.addEventListener(
      "touchmove",
      function (e) {
        scrollEnabled = false;
        if (e.touches && e.touches.length > 0) {
          const t = e.touches[0];
          targetX = t.clientX;
          targetY = t.clientY;
        }
      },
      { passive: true }
    );

    // Cuando termina el toque, dejamos que el scroll pueda recenter
    window.addEventListener("touchend", function () {
      scrollEnabled = true;
    });

    // Mobile scroll: si no hay puntero fino y scrollEnabled, recentrar
    window.addEventListener("scroll", function () {
      if (!window.matchMedia("(pointer: fine)").matches && scrollEnabled) {
        targetX = window.innerWidth / 2;
        targetY = window.innerHeight * 0.4;
      }
    });
  })();
</script>

