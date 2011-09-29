/* vinagre-utils.h generated by valac 0.12.0, the Vala compiler, do not modify */

/*
 * Workaround for https://bugzilla.gnome.org/show_bug.cgi?id=660373
 * File taken from OpenSUSE: vinagre-fix-missing-header.patch
 */ 

#ifndef __VINAGRE_VINAGRE_UTILS_H__
#define __VINAGRE_VINAGRE_UTILS_H__

#include <glib.h>
#include <stdlib.h>
#include <string.h>
#include <gtk/gtk.h>

G_BEGIN_DECLS



gboolean vinagre_utils_parse_boolean (const gchar* str);
void vinagre_utils_set_widget_visible (GtkWidget* widget, gboolean visible);
void vinagre_utils_show_error_dialog (const gchar* title, const gchar* message, GtkWindow* parent);
void vinagre_utils_show_many_errors (const gchar* title, GSList* items, GtkWindow* parent);
gboolean vinagre_utils_create_dir_for_file (const gchar* filename, GError** error);
GtkBuilder* vinagre_utils_get_builder (void);
gchar* vinagre_dirs_get_package_data_file (const gchar* filename);
gboolean vinagre_utils_request_credential (GtkWindow* parent, const gchar* protocol, const gchar* host, gboolean need_username, gboolean need_password, gint password_limit, gchar** username, gchar** password, gboolean* save_in_keyring);
void vinagre_utils_show_help (GtkWindow* window, const gchar* page);
void vinagre_utils_show_help_about (GtkWindow* parent);
gchar* vinagre_dirs_get_user_cache_dir (void);


G_END_DECLS

#endif
