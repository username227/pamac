/*
 * Pamac - Ayatana AppIndicator tray backend
 *
 * Copyright (C) 2026 Pamac-Fix contributors
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 */

namespace Pamac {
	// GtkStatusIcon cannot publish a native Wayland tray item. Ayatana
	// AppIndicator exports the freedesktop StatusNotifierItem interface.
	class IndicatorTrayIcon : TrayIcon {
		AppIndicator.Indicator indicator_status_icon;

		public override void init_status_icon () {
			indicator_status_icon = new AppIndicator.Indicator (
				"pamac-tray", "pamac-tray-no-update",
				AppIndicator.IndicatorCategory.APPLICATION_STATUS
			);

			// The context menu is identical to the legacy GTK/X11 menu.
			indicator_status_icon.set_menu (create_menu ());
			indicator_status_icon.set_status (AppIndicator.IndicatorStatus.PASSIVE);
		}

		public override void set_tooltip (string info) {
			// StatusNotifierItem exposes a title, not GtkStatusIcon tooltip markup.
			indicator_status_icon.set_title (info);
		}

		public override void set_icon (string icon) {
			indicator_status_icon.set_icon_full (icon, icon);
		}

		public override void set_icon_visible (bool visible) {
			indicator_status_icon.set_status (
				visible ? AppIndicator.IndicatorStatus.ACTIVE
				        : AppIndicator.IndicatorStatus.PASSIVE
			);
		}
	}
}
