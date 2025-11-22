
(function () {
  const lightbox = document.getElementById('lightbox');
  const imgEl = document.getElementById('lightbox-img');
  const captionEl = document.getElementById('lightbox-caption');
  const closeBtn = document.querySelector('.lightbox-close');

  // Open
  document.addEventListener('click', (e) => {
    const link = e.target.closest('a[data-lightbox]');
    if (!link) return;

    e.preventDefault();

    const href = link.getAttribute('href');
    const title = link.getAttribute('data-title') || e.target.alt || '';

    imgEl.src = href;
    imgEl.alt = title;
    captionEl.textContent = title;

    lightbox.classList.add('open');
    lightbox.setAttribute('aria-hidden', 'false');

    // trap focus on close button
    closeBtn.focus();
  });

  // Close on button
  closeBtn.addEventListener('click', () => {
    lightbox.classList.remove('open');
    lightbox.setAttribute('aria-hidden', 'true');
    imgEl.removeAttribute('src');
    imgEl.removeAttribute('alt');
    captionEl.textContent = '';
  });

  // Close on Escape
  document.addEventListener('keydown', (e) => {
    if (e.key === 'Escape' && lightbox.classList.contains('open')) {
      closeBtn.click();
    }
  });

  // Close on backdrop click
  lightbox.addEventListener('click', (e) => {
    if (e.target === lightbox) closeBtn.click();
  });
})();
