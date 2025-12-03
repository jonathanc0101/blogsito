(function () {
  const root = document.documentElement;

  let scrollEnabled = true;

  // -----------------------------------
  // SPOTLIGHT (igual que antes)
  // -----------------------------------

  let spotX = window.innerWidth / 2;
  let spotY = window.innerHeight * 0.4;

  let targetX = spotX;
  let targetY = spotY;

  function setSpot(x, y) {
    root.style.setProperty("--spot-x", x + "px");
    root.style.setProperty("--spot-y", y + "px");
  }

  function animate() {
    const ease = 0.25;

    spotX += (targetX - spotX) * ease;
    spotY += (targetY - spotY) * ease;

    setSpot(spotX, spotY);
    requestAnimationFrame(animate);
  }

  requestAnimationFrame(animate);

  window.addEventListener("mousemove", function (e) {
    scrollEnabled = false;
    targetX = e.clientX;
    targetY = e.clientY;
  });

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

  window.addEventListener("touchend", function () {
    scrollEnabled = true;
  });

  window.addEventListener("scroll", function () {
    if (!window.matchMedia("(pointer: fine)").matches && scrollEnabled) {
      targetX = window.innerWidth / 2;
      targetY = window.innerHeight * 0.4;
    }
  });

  // -----------------------------------
  // ORDENAMIENTO VERTICAL ALEATORIO
  // -----------------------------------

  function randomVerticalSpacing() {
    const alerts = Array.from(
      document.querySelectorAll(".page-spotlight .alert")
    );

    if (alerts.length === 0) return;

    let currentY = 60; // punto inicial arriba

    alerts.forEach((alert, index) => {
      // separaciones aleatorias
      const spacing = 200 + Math.abs(Math.random()) * 500;

      // Posicionar usando transform
      alert.style.position = "absolute";
      alert.style.left = "50%";
      alert.style.transform = `translateX(-50%) translateY(${currentY}px)`;

      currentY += spacing; // siguiente alert más abajo
    });
  }

  window.addEventListener("load", randomVerticalSpacing);
})();
