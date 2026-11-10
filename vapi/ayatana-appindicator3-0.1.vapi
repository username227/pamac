/*
 * Minimal Ayatana AppIndicator Vala bindings for Pamac's Gtk3 namespace.
 *
 * Pamac ships gtk+-3.0.vapi with the namespace renamed to Gtk3 so that
 * GTK3 and GTK4 can coexist in the build. The distribution-provided
 * AppIndicator vapi expects Gtk.Menu and therefore cannot be used directly.
 *
 * The ABI and symbols here are provided by libayatana-appindicator.
 */
[CCode (cprefix = "AppIndicator", lower_case_cprefix = "app_indicator_",
        cheader_filename = "libayatana-appindicator/app-indicator.h")]
namespace AppIndicator {
	[CCode (cname = "AppIndicatorCategory", cprefix = "APP_INDICATOR_CATEGORY_")]
	public enum IndicatorCategory {
		APPLICATION_STATUS
	}

	[CCode (cname = "AppIndicatorStatus", cprefix = "APP_INDICATOR_STATUS_")]
	public enum IndicatorStatus {
		PASSIVE,
		ACTIVE,
		ATTENTION
	}

	[CCode (cname = "AppIndicator", type_id = "app_indicator_get_type ()")]
	public class Indicator : GLib.Object {
		[CCode (cname = "app_indicator_new")]
		public Indicator (string id, string icon_name, IndicatorCategory category);

		[CCode (cname = "app_indicator_set_status")]
		public void set_status (IndicatorStatus status);
		[CCode (cname = "app_indicator_set_icon_full")]
		public void set_icon_full (string icon_name, string icon_desc);
		[CCode (cname = "app_indicator_set_title")]
		public void set_title (string title);
		[CCode (cname = "app_indicator_set_menu")]
		public void set_menu (Gtk3.Menu menu);	}
}
