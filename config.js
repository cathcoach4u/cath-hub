// Supabase Configuration
// This file centralizes Supabase credentials for all HTML pages
const SUPABASE_CONFIG = {
  url: 'https://ziwycymhaqghdiznyhhw.supabase.co',
  anonKey: 'sb_publishable_n-xBxzqdGySGh-JWHuI40g_Hb5Qf8mg'
};

// Helper function to show toast notifications
function showToast(message, type = 'info', duration = 3000) {
  const toast = document.createElement('div');
  toast.style.cssText = `
    position: fixed;
    bottom: 20px;
    right: 20px;
    padding: 12px 16px;
    border-radius: 6px;
    font-size: 13px;
    font-weight: 500;
    z-index: 9999;
    animation: slideIn 0.3s ease-out;
    ${type === 'error' ? 'background: #fee2e2; color: #991b1b; border: 1px solid #fecaca;' : ''}
    ${type === 'success' ? 'background: #dcfce7; color: #166534; border: 1px solid #86efac;' : ''}
    ${type === 'info' ? 'background: #dbeafe; color: #1e40af; border: 1px solid #93c5fd;' : ''}
  `;
  toast.textContent = message;
  document.body.appendChild(toast);

  setTimeout(() => {
    toast.style.animation = 'slideOut 0.3s ease-out';
    setTimeout(() => toast.remove(), 300);
  }, duration);
}

// Helper function to disable/enable buttons
function lockBtn(btn, text = 'Saving...') {
  if (btn) {
    btn.disabled = true;
    btn._originalText = btn.textContent;
    btn.textContent = text;
  }
}

function unlockBtn(btn) {
  if (btn) {
    btn.disabled = false;
    btn.textContent = btn._originalText || 'Save';
  }
}

// Add CSS animation styles
const style = document.createElement('style');
style.textContent = `
  @keyframes slideIn {
    from { transform: translateX(400px); opacity: 0; }
    to { transform: translateX(0); opacity: 1; }
  }
  @keyframes slideOut {
    from { transform: translateX(0); opacity: 1; }
    to { transform: translateX(400px); opacity: 0; }
  }
`;
document.head.appendChild(style);
