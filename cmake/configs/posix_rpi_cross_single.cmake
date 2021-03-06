# 使用这个文件可在上位机交叉编译px4firmware
include(posix/px4_impl_posix)

# This definition allows to differentiate if this just the usual POSIX build
# or if it is for the RPi.
add_definitions(
	-D__PX4_POSIX_RPI
	-D__DF_LINUX # For DriverFramework
	-D__DF_RPI # For raspberry pi
)

# 硬件驱动模块
set(config_module_list
	#
	# Board support modules
	#
	drivers/device
	modules/sensors
	platforms/posix/drivers/df_mpu9250_wrapper
	#platforms/posix/drivers/df_lsm9ds1_wrapper
	platforms/posix/drivers/df_ms5611_wrapper
	#platforms/posix/drivers/df_hmc5883_wrapper
	platforms/posix/drivers/df_trone_wrapper
	#platforms/posix/drivers/df_isl29501_wrapper

	#
	# System commands
	#
	systemcmds/param
	systemcmds/mixer
	systemcmds/ver
	systemcmds/esc_calib
	systemcmds/reboot
	systemcmds/topic_listener
	systemcmds/perf

	#
	# Estimation modules
	#
	modules/attitude_estimator_q
	modules/position_estimator_inav
	modules/local_position_estimator
	modules/ekf2

	#
	# Vehicle Control
	#
	modules/mc_att_control
	modules/mc_pos_control
	modules/fw_att_control
	modules/fw_pos_control_l1
	modules/vtol_att_control

	#
	# Library modules
	#
	modules/sdlog2
	modules/logger
	modules/commander
	modules/param
	modules/systemlib
	modules/systemlib/mixer
	modules/uORB
	modules/dataman
	modules/land_detector
	modules/navigator
	modules/mavlink

	#
	# PX4 drivers
	#
	drivers/gps
	drivers/rpi_rc_in
	#drivers/navio_sysfs_rc_in
	#drivers/navio_sysfs_pwm_out
	#drivers/navio_gpio
	#drivers/navio_rgbled

	#
	# Libraries
	#
	lib/controllib
	lib/mathlib
	lib/mathlib/math/filter
	lib/geo
	lib/ecl
	lib/geo_lookup
	lib/launchdetection
	lib/external_lgpl
	lib/conversion
	lib/terrain_estimation
	lib/runway_takeoff
	lib/tailsitter_recovery
	lib/DriverFramework/framework

	#
	# POSIX
	#
	platforms/common
	platforms/posix/px4_layer
	platforms/posix/work_queue
)

#
# DriverFramework driver
#
set(config_df_driver_list
	mpu9250
	#lsm9ds1
	ms5611
	#hmc5883
	trone
	#isl29501
)

# 设定交叉工具链
set(CMAKE_TOOLCHAIN_FILE ${PX4_SOURCE_DIR}/cmake/toolchains/Toolchain-arm-bcm2835-linx-gnueabihf-raspbian.cmake)


#set(CMAKE_PROGRAM_PATH
#	"${RPI_TOOLCHAIN_DIR}/arm-bcm2835-linux-gnueabihf/bin"
#	${CMAKE_PROGRAM_PATH}
#)*/
