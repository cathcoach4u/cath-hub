# AisleMate Migration Guide - Cath Hub to Baker Hub

This document contains everything needed to add the AisleMate shopping system to Baker Hub. Both apps share the same Supabase project, so the database tables already exist.

## Dependencies

Add this script tag before your main `<script>`:

```html
<script src="https://cdn.jsdelivr.net/npm/qrious@4.0.2/dist/qrious.min.js"></script>
```

## Supabase Tables (already exist)

- `shopping_items` (name, category, store, checked, created_at)
- `master_items` (name, category, store, family_member, last_price, last_seen)
- `receipts` (store, receipt_date, total, uploaded_at, filename, url)
- `receipt_items` (item_name, price, quantity, receipt_id)
- `meal_plans` (day_index, meal, notes, who_home)
- Storage bucket: `receipts`

## Receipt Scanning

Receipts are scanned via a Supabase Edge Function at:
`https://ziwycymhaqghdiznyhhw.supabase.co/functions/v1/claude-proxy`

This proxies requests to Claude Haiku for receipt OCR. No API key needed in the frontend.

---

## Step 1: Navigation

Add an AisleMate nav item to:

**Desktop sidebar:**
```html
<button class="nav-item" onclick="chNav('aislemate',this)"><span class="icon">&#x1F6D2;</span> AisleMate</button>
```

**Mobile drawer:**
```html
<button class="mobile-nav-item" data-nav="aislemate" onclick="chNavMobile('aislemate',this)"><span class="icon">&#x1F6D2;</span> AisleMate</button>
```

In the `chNav()` function, add:
```javascript
if(name === 'aislemate') amGo('home');
```

---

## Step 2: CSS

Add these styles inside the `<style>` tag. **Change `#cathHub` to whatever scope prefix Baker Hub uses.**

```css
/* ───── AISLEMATE ───── */
#cathHub .am-search { width: 100% !important; padding: 14px 18px 14px 44px !important; border: 1px solid #e2e8f0 !important; border-radius: 12px !important; font-size: 14px !important; background: white url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='18' height='18' fill='%2394a3b8' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27A6.47 6.47 0 0016 9.5 6.5 6.5 0 109.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3C/svg%3E") 14px center no-repeat !important; outline: none !important; margin-bottom: 24px !important; }
#cathHub .am-search:focus { border-color: #3b82f6 !important; }
#cathHub .am-grid { display: grid !important; grid-template-columns: 1fr 1fr !important; gap: 16px !important; margin-bottom: 24px !important; }
#cathHub .am-tile { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; padding: 28px 20px !important; text-align: center !important; cursor: pointer !important; transition: all 0.15s !important; }
#cathHub .am-tile:hover { border-color: #3b82f6 !important; box-shadow: 0 2px 8px rgba(59,130,246,0.1) !important; }
#cathHub .am-tile.highlight { background: #fef9ee !important; border-color: #f59e0b !important; }
#cathHub .am-tile .tile-icon { font-size: 32px !important; margin-bottom: 10px !important; }
#cathHub .am-tile .tile-title { font-size: 16px !important; font-weight: 700 !important; margin-bottom: 4px !important; }
#cathHub .am-tile .tile-sub { font-size: 12px !important; color: #64748b !important; }
#cathHub .am-progress { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; padding: 18px 24px !important; display: flex !important; align-items: center !important; justify-content: space-between !important; margin-bottom: 24px !important; }
#cathHub .am-progress .prog-label { font-weight: 700 !important; font-size: 14px !important; }
#cathHub .am-progress .prog-count { font-size: 13px !important; color: #64748b !important; }
#cathHub .am-progress-bar { height: 6px !important; background: #e2e8f0 !important; border-radius: 3px !important; flex: 1 !important; margin: 0 16px !important; overflow: hidden !important; }
#cathHub .am-progress-fill { height: 100% !important; background: #10b981 !important; border-radius: 3px !important; transition: width 0.3s !important; }
#cathHub .am-subscreen { display: none !important; }
#cathHub .am-subscreen.active { display: block !important; }
#cathHub .am-header-bar { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; padding: 18px 24px !important; display: flex !important; align-items: center !important; justify-content: space-between !important; margin-bottom: 8px !important; flex-wrap: wrap !important; gap: 10px !important; }
#cathHub .am-header-bar h3 { font-size: 18px !important; font-weight: 700 !important; }
#cathHub .am-header-actions { display: flex !important; align-items: center !important; gap: 12px !important; }
#cathHub .am-header-actions .check-count { color: #10b981 !important; font-size: 13px !important; font-weight: 600 !important; }
#cathHub .am-btn { padding: 8px 16px !important; border: 1px solid #e2e8f0 !important; border-radius: 8px !important; font-size: 13px !important; font-weight: 600 !important; background: white !important; display: flex !important; align-items: center !important; gap: 6px !important; color: #1e293b !important; cursor: pointer !important; }
#cathHub .am-btn:hover { background: #f8fafc !important; }
#cathHub .am-btn.primary { background: #10b981 !important; color: white !important; border-color: #10b981 !important; }
#cathHub .am-back { font-size: 13px !important; color: #3b82f6 !important; cursor: pointer !important; margin-bottom: 16px !important; display: inline-flex !important; align-items: center !important; gap: 4px !important; font-weight: 600 !important; }
#cathHub .list-progress { height: 6px !important; background: #e2e8f0 !important; border-radius: 3px !important; margin: 16px 0 24px !important; overflow: hidden !important; }
#cathHub .list-progress-fill { height: 100% !important; background: #10b981 !important; border-radius: 3px !important; transition: width 0.3s !important; }
#cathHub .cat-group { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; margin-bottom: 16px !important; overflow: hidden !important; }
#cathHub .cat-header { padding: 16px 20px !important; display: flex !important; align-items: center !important; justify-content: space-between !important; font-weight: 700 !important; font-size: 14px !important; }
#cathHub .cat-count { font-size: 12px !important; color: #94a3b8 !important; font-weight: 500 !important; }
#cathHub .shop-item { padding: 14px 20px !important; border-top: 1px solid #f1f5f9 !important; display: flex !important; align-items: center !important; gap: 12px !important; }
#cathHub .shop-check { width: 22px !important; height: 22px !important; border: 2px solid #cbd5e1 !important; border-radius: 6px !important; cursor: pointer !important; display: flex !important; align-items: center !important; justify-content: center !important; flex-shrink: 0 !important; transition: all 0.15s !important; background: white !important; }
#cathHub .shop-check:hover { border-color: #10b981 !important; }
#cathHub .shop-check.done { background: #10b981 !important; border-color: #10b981 !important; }
#cathHub .shop-check.done::after { content: '\2713' !important; color: white !important; font-size: 12px !important; font-weight: 700 !important; }
#cathHub .shop-name { font-size: 14px !important; font-weight: 600 !important; flex: 1 !important; }
#cathHub .shop-name.checked { text-decoration: line-through !important; color: #94a3b8 !important; }
#cathHub .store-tag { font-size: 10px !important; padding: 2px 8px !important; border-radius: 99px !important; font-weight: 600 !important; background: #ecfdf5 !important; color: #059669 !important; }
#cathHub .store-tag.aldi { background: #eff6ff !important; color: #2563eb !important; }
#cathHub .store-tag.woolies { background: #f0fdf4 !important; color: #16a34a !important; }
#cathHub .store-tag.coles { background: #fef2f2 !important; color: #ef4444 !important; }
#cathHub .shop-delete { color: #94a3b8 !important; cursor: pointer !important; font-size: 16px !important; padding: 4px !important; }
#cathHub .shop-delete:hover { color: #ef4444 !important; }
#cathHub .family-section { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; margin-bottom: 16px !important; overflow: hidden !important; }
#cathHub .family-header { padding: 20px !important; display: flex !important; align-items: center !important; justify-content: space-between !important; cursor: pointer !important; }
#cathHub .family-header .fam-left { display: flex !important; align-items: center !important; gap: 12px !important; }
#cathHub .family-header .fam-avatar { font-size: 28px !important; }
#cathHub .family-header .fam-name { font-size: 16px !important; font-weight: 700 !important; }
#cathHub .family-header .fam-count { font-size: 12px !important; color: #94a3b8 !important; }
#cathHub .family-header .fam-badge { font-size: 12px !important; padding: 4px 12px !important; border-radius: 99px !important; background: #eff6ff !important; color: #3b82f6 !important; font-weight: 600 !important; }
#cathHub .family-body { padding: 0 20px 20px !important; }
#cathHub .family-empty { text-align: center !important; padding: 24px !important; color: #94a3b8 !important; font-size: 13px !important; }
#cathHub .fam-item { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 10px !important; padding: 14px 16px !important; margin-bottom: 8px !important; display: flex !important; align-items: center !important; justify-content: space-between !important; }
#cathHub .fam-item-left { display: flex !important; flex-direction: column !important; gap: 4px !important; }
#cathHub .fam-item-name { font-weight: 600 !important; font-size: 14px !important; }
#cathHub .fam-item-tags { display: flex !important; gap: 6px !important; align-items: center !important; }
#cathHub .fam-item-tags .tag { font-size: 10px !important; padding: 2px 8px !important; border-radius: 99px !important; font-weight: 600 !important; }
#cathHub .tag.store { background: #eff6ff !important; color: #2563eb !important; }
#cathHub .tag.type { background: #f1f5f9 !important; color: #64748b !important; }
#cathHub .fam-add-btn { width: 32px !important; height: 32px !important; border-radius: 50% !important; background: #10b981 !important; color: white !important; font-size: 18px !important; display: flex !important; align-items: center !important; justify-content: center !important; cursor: pointer !important; flex-shrink: 0 !important; }
#cathHub .settings-card { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; padding: 24px !important; margin-bottom: 16px !important; }
#cathHub .settings-card h3 { font-size: 16px !important; font-weight: 700 !important; margin-bottom: 4px !important; }
#cathHub .settings-card .settings-desc { font-size: 13px !important; color: #64748b !important; margin-bottom: 16px !important; }
#cathHub .user-grid { display: grid !important; grid-template-columns: 1fr 1fr !important; gap: 10px !important; }
#cathHub .user-option { padding: 10px 16px !important; border: 2px solid #e2e8f0 !important; border-radius: 10px !important; cursor: pointer !important; display: flex !important; align-items: center !important; gap: 8px !important; font-size: 14px !important; font-weight: 500 !important; transition: all 0.15s !important; }
#cathHub .user-option:hover { border-color: #94a3b8 !important; }
#cathHub .user-option.selected { border-color: #10b981 !important; background: #ecfdf5 !important; }
#cathHub .user-dot { width: 12px !important; height: 12px !important; border-radius: 50% !important; border: 2px solid #cbd5e1 !important; }
#cathHub .user-option.selected .user-dot { background: #10b981 !important; border-color: #10b981 !important; }
#cathHub .qr-card { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 14px !important; padding: 32px 24px !important; text-align: center !important; max-width: 400px !important; margin: 0 auto !important; }
#cathHub .qr-card h4 { font-size: 16px !important; font-weight: 700 !important; margin-bottom: 4px !important; }
#cathHub .qr-card p { font-size: 13px !important; color: #64748b !important; margin-bottom: 20px !important; }
#cathHub .qr-card canvas { border-radius: 8px !important; }
#cathHub .qr-url { font-size: 11px !important; color: #94a3b8 !important; word-break: break-all !important; margin-top: 16px !important; background: #f8fafc !important; padding: 8px 12px !important; border-radius: 6px !important; }
#cathHub .am-add-form { display: flex !important; gap: 8px !important; align-items: center !important; margin-top: 12px !important; flex-wrap: wrap !important; }
#cathHub .am-add-input { flex: 1 !important; min-width: 140px !important; padding: 8px 12px !important; border: 1px solid #e2e8f0 !important; border-radius: 8px !important; font-size: 13px !important; }
#cathHub .am-add-select { padding: 8px !important; border: 1px solid #e2e8f0 !important; border-radius: 8px !important; font-size: 13px !important; background: white !important; }
#cathHub .am-suggest-list { position: absolute !important; top: 100% !important; left: 0 !important; right: 0 !important; background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 8px !important; max-height: 180px !important; overflow-y: auto !important; z-index: 10 !important; box-shadow: 0 4px 12px rgba(0,0,0,0.1) !important; }
#cathHub .am-suggest-item { padding: 8px 12px !important; cursor: pointer !important; font-size: 13px !important; border-bottom: 1px solid #f1f5f9 !important; }
#cathHub .am-suggest-item:hover { background: #f0f4f8 !important; }
#cathHub .am-suggest-item .suggest-price { font-size: 11px !important; color: #94a3b8 !important; }
#cathHub .receipt-card { background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 12px !important; padding: 16px !important; margin-bottom: 12px !important; }
#cathHub .receipt-header { display: flex !important; align-items: center !important; gap: 10px !important; cursor: pointer !important; }
#cathHub .receipt-items { margin-top: 12px !important; border-top: 1px solid #f1f5f9 !important; padding-top: 12px !important; }
#cathHub .receipt-item-row { display: flex !important; justify-content: space-between !important; padding: 4px 0 !important; font-size: 13px !important; }
#cathHub .receipt-item-row .ri-price { font-weight: 600 !important; color: #1e293b !important; }
#cathHub .master-item { display: flex !important; align-items: center !important; gap: 10px !important; padding: 10px 12px !important; background: white !important; border: 1px solid #e2e8f0 !important; border-radius: 8px !important; margin-bottom: 6px !important; cursor: pointer !important; transition: border-color 0.15s !important; }
#cathHub .master-item.selected { border-color: #3b82f6 !important; background: #eff6ff !important; }
#cathHub .master-item .mi-check { width: 20px !important; height: 20px !important; border: 2px solid #cbd5e1 !important; border-radius: 4px !important; flex-shrink: 0 !important; display: flex !important; align-items: center !important; justify-content: center !important; font-size: 12px !important; }
#cathHub .master-item.selected .mi-check { background: #3b82f6 !important; border-color: #3b82f6 !important; color: white !important; }
#cathHub .mi-store { font-size: 10px !important; padding: 2px 6px !important; border-radius: 4px !important; font-weight: 600 !important; text-transform: uppercase !important; }
#cathHub .mi-store.aldi { background: #fef3c7 !important; color: #92400e !important; }
#cathHub .mi-store.woolworths { background: #dcfce7 !important; color: #166534 !important; }
#cathHub .mi-store.coles { background: #fce7f3 !important; color: #9d174d !important; }
#cathHub .mi-store.bakersdelight { background: #fff7ed !important; color: #9a3412 !important; }
#cathHub .mi-store.belrosepharmacy { background: #ede9fe !important; color: #5b21b6 !important; }
#cathHub .mi-store.amazon { background: #fff7ed !important; color: #9a3412 !important; }
```

**Dark mode additions:**
```css
body.dark-mode #cathHub .cat-group,
body.dark-mode #cathHub .am-tile,
body.dark-mode #cathHub .am-header-bar,
body.dark-mode #cathHub .am-progress { background: #1e293b !important; border-color: #334155 !important; color: #e2e8f0 !important; }
body.dark-mode #cathHub .am-tile .tile-title { color: #f1f5f9 !important; }
body.dark-mode #cathHub .shop-item { border-color: #334155 !important; }
body.dark-mode #cathHub .shop-name { color: #f1f5f9 !important; }
body.dark-mode #cathHub .am-btn { background: #1e293b !important; border-color: #334155 !important; color: #e2e8f0 !important; }
body.dark-mode #cathHub .am-btn.primary { background: #10b981 !important; color: white !important; border-color: #10b981 !important; }
body.dark-mode #cathHub .am-search { background: #1e293b !important; border-color: #334155 !important; color: #e2e8f0 !important; }
```

---

## Step 3: HTML

Add this screen inside the `.main` div, alongside other screens. The source is the `<div class="screen" id="ch-aislemate">` block in `cathcoach4u/personal-cath-hub` `index.html` (approximately lines 730-932).

**Instructions for Claude:** Read the AisleMate HTML directly from the source file at `https://github.com/cathcoach4u/personal-cath-hub/blob/main/index.html` — search for `id="ch-aislemate"` and copy the entire block through its closing `</div>`.

---

## Step 4: JavaScript

Add inside the main `<script>` tag.

### Constants (add near top of script)

```javascript
var CAT_ICONS = {'Fruit & Veg':'&#x1F96C;','Meat':'&#x1F969;','Dairy':'&#x1F95B;','Pantry':'&#x1F96B;','Frozen':'&#x2744;','Drinks':'&#x1F964;','Household':'&#x1F9F9;','Other':'&#x1F4E6;'};
var CAT_ORDER = ['Fruit & Veg','Meat','Dairy','Pantry','Frozen','Drinks','Household','Other'];
var DAYS = ['Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday'];
var FAMILY = [
  { name: 'Cath', avatar: '&#x1F469;' },
  { name: 'Andrew', avatar: '&#x1F468;' },
  { name: 'Sarah', avatar: '&#x1F467;' },
  { name: 'Russell', avatar: '&#x1F466;' }
];
var masterItems = [];
var masterSelected = new Set();
```

### Functions to copy

**Instructions for Claude:** Read ALL the following functions directly from the source file at `https://github.com/cathcoach4u/personal-cath-hub/blob/main/index.html` and copy them into Baker Hub's script section:

| Category | Functions |
|----------|-----------|
| **Helper** | `esc()` (HTML escaping - skip if already exists) |
| **Navigation** | `amGo()` |
| **Shopping List** | `amLoadItems()`, `renderShopItem()`, `amCheck()`, `amDeleteItem()`, `amUpdateCounts()`, `amRefresh()`, `amAddItem()`, `amQtyChange()`, `amRepeatLastShop()` |
| **Suggestions** | `amSuggest()`, `amPickSuggestion()` |
| **Master List** | `amLoadMaster()`, `amRenderMaster()`, `amFilteredItems()`, `amFilterMaster()`, `amToggleMaster()`, `amUpdateSelBar()`, `amAddSelected()`, `amAssignFamily()` |
| **Family** | `amLoadFamily()`, `amAddFromFamily()` |
| **Receipts** | `fileToBase64()`, `amScanReceipt()`, `amUploadReceipts()`, `amLoadReceipts()`, `amDeleteReceipt()` |
| **Analytics** | `amLoadSpending()`, `amLoadHistory()` |
| **Meals** | `amLoadMeals()` |
| **Sharing** | `amShareList()`, `amGenerateQR()`, `amCopyQRLink()` |
| **Settings** | `amSelectUser()` |

### Quick Access Link Init

In the page init (after auth check), add:
```javascript
var qlEl = document.getElementById('am-quick-link');
if (qlEl) {
  var basePath = window.location.pathname.replace(/\/[^\/]*$/, '/');
  qlEl.value = window.location.origin + basePath + 'shopping.html';
}
```

---

## Step 5: Also copy `shopping.html`

The standalone `shopping.html` file should also be copied to Baker Hub. It's a self-contained single-page shopping list that works without login (used by the QR code feature). Copy it directly from the Cath Hub repo.

---

## Important Notes

- Replace `#cathHub` with Baker Hub's CSS scope prefix throughout (e.g., `#bakerHub`)
- The `sb` variable must be the Supabase client - both apps use the same instance
- The `esc()` helper function may already exist in Baker Hub - don't duplicate it
- Update the FAMILY array names if Baker Hub has different family members
- The receipt scanner uses a Supabase Edge Function (`claude-proxy`) - no API key needed in frontend code
- Both apps share the same Supabase tables, so data entered in one app appears in the other
