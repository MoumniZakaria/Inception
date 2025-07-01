<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the web site, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * Localized language
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** Database username */
define( 'DB_USER', 'zmoumni' );

/** Database password */
define( 'DB_PASSWORD', 'password' );

/** Database hostname */
define( 'DB_HOST', 'mariadb' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define( 'AUTH_KEY',          'Y)NXm G~uaA/VaL<T?A~t/6__Rk[Lz2L5{]~mOG+73mre:,^A3|{6;6DC9rt25e$' );
define( 'SECURE_AUTH_KEY',   '=.M(70}}tzUr*x(=[q;iQo8 ct25&w?~CA1[QHf,DXE<v@d6P *~v )HMBp43jLg' );
define( 'LOGGED_IN_KEY',     '?K=${0c>_$UlDSPWD`1KY7Nwq,xw?TImh!i`%2-%FE*Pu?Q//$`, tj1+Kjb#7D_' );
define( 'NONCE_KEY',         '97v1{E`~$1aQ|M:nO+w+n|jG8;44V!FkJ=)L:cRK<N 8Y43g*-#C.1oSVy=e&hKx' );
define( 'AUTH_SALT',         'pU{[xmES6[r::5R,a)j+YWybWU9>+Kzt.5h@r[;Z.HU=YXNq6Yx>2qJaa<7Wob{a' );
define( 'SECURE_AUTH_SALT',  'vf8&c~8G+X?5,V+h?mL<af}d:C,(G4>v,0VujUc{nEC#OpG3=_O}(bJfiN=d{c@T' );
define( 'LOGGED_IN_SALT',    '>cj{$PT7=waV?NCfd}+$:X{{COC~`) ~4je$r3(he.>eTfF]=#j?;qCxQw4|rg)s' );
define( 'NONCE_SALT',        '08/(v&kL!jt@|o[dD1$INj!IRw3@O9lA]Y=lX(ExXAvfw#NPYDLv~A$B5W{GG99_' );
define( 'WP_CACHE_KEY_SALT', 'uBgq/i7vW63s^olW%&)x2};$zQo5{$_mR*!,[:oLpfiz#QJ2Y8:+f]e=is<AVt@6' );


/**#@-*/

/**
 * WordPress database table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';


/* Add any custom values between this line and the "stop editing" line. */



/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
if ( ! defined( 'WP_DEBUG' ) ) {
	define( 'WP_DEBUG', false );
}

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
