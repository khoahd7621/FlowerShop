function toast({ title = '', message = '', type = 'info', duration = '' }) {
    const mainToast = document.getElementById('toast');
    console.log(mainToast)
    if (mainToast) {
        const toast = document.createElement('div');

        // Auto remove toast
        const autoRemoveId = setTimeout(function () {
            mainToast.removeChild(toast);
        }, duration + 500);

        // Remove toast when clicked
        toast.onclick = function (e) {
            if (e.target.closest('.toast__close')) {
                mainToast.removeChild(toast);
                clearTimeout(autoRemoveId);
            }
        }

        const icons = {
            success: 'bi bi-check-circle-fill',
            info: 'bi bi-info-circle-fill',
            warning: 'bi bi-exclamation-circle-fill',
            error: 'bi bi-x-circle-fill',
        };

        const icon = icons[type];
        const delay = (duration / 1000).toFixed(2);

        toast.classList.add('toast', `toast--${type}`, 'd-flex');
        toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;
        toast.innerHTML = `
                    <div class="toast__icon">
                        <i class="${icon}"></i>
                    </div>
                    <div class="toast__body">
                        <h3 class="toast__title">${title}</h3>
                        <p class="toast__msg">${message}</p>
                    </div>
                    <div class="toast__close">
                        <i class="bi bi-x"></i>
                    </div>
                `;
        mainToast.appendChild(toast);
    }
}