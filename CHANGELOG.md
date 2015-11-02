## 0.2.2
 * add `mbed` keyword for easier discovery

## 0.2.1
 * define `uvisor.present` config value as 1 (true) by default

# 0.2.0
 * add `.uninitialized` section for uninitialised data.

## 0.1.4
 * add hardware.test-pins config to indicate which pins should be used by
   tests.

## 0.1.3
 * add config to select the default networking stack for this target (by
   default LWIP, which is used for the on-board ethernet). This is a default
   value that can be overridden by a derived target or application-specific
   config.

## 0.1.2
 * add updated symbols for [uvisor](https://github.com/armmbed/uvisor)
 * **note** backwards compatibility is maintained, but the symbols used by the
   old version of uvisor will go away soon.

## 0.1.1
 * update mbed-gcc inheritance to ~0.1.0 (erroneously missed from v0.1 release)

# 0.1.0
 * add information about board pin names to config (to be used by mbed-hal)
 * add vector table information to config (to be used by uvisor)

# 0.0.24
For this and prior versions no changelog information was recorded. Please see
the git history.
