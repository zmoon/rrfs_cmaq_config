MACHINE="hera"
ACCOUNT="naqfc"
EXPT_BASEDIR="/scratch2/NCEPDEV/stmp3/$LOGNAME/expt_dirs"
EXPT_SUBDIR="test_da_gsdhrrr25_1day"

PRINT_ESMF="FALSE"

RUN_ENVIR="community"
PREEXISTING_DIR_METHOD="rename"

#USE_CRON_TO_RELAUNCH="TRUE"
#CRON_RELAUNCH_INTVL_MNTS="3"

FCST_MODEL="fv3gfs_aqm"

PREDEF_GRID_NAME="GSD_HRRR_25km"
GRID_GEN_METHOD="ESGgrid"
HALO_BLEND="0"

CCPP_PHYS_SUITE="FV3_GFS_2017_gfdlmp"
FCST_LEN_HRS="12"
LBC_SPEC_INTVL_HRS="6"

DATE_FIRST_CYCL="20190801"
DATE_LAST_CYCL="20190801"
CYCL_HRS=( "00" "06" "12" "18" )

RESTART_INTERVAL="6"

WTIME_RUN_FCST="01:00:00"

RUN_TASK_ADD_AQM_ICS="TRUE"
RUN_TASK_ADD_AQM_LBCS="TRUE"
RUN_TASK_RUN_NEXUS="TRUE"
RUN_TASK_RUN_POST="TRUE"

RUN_ADD_AQM_CHEM_LBCS="TRUE"
RUN_ADD_AQM_GEFS_LBCS="TRUE"
AQM_GEFS_CYC="00"

OPT_DA_RRFS_CMAQ="TRUE"
RUN_TASK_CHEM_ANAL="TRUE"
USE_CHEM_ANAL="TRUE"
RUN_TASK_DACYC="TRUE"

FV3_EXEC_FN="NEMS.x"
FV3_NML_BASE_SUITE_FN="input.nml.fv3gfs_aqm_FV3_GFS_2017_gfdlmp"
FV3_NML_YAML_CONFIG_FN="fv3gfs_aqm.input.yml"
WFLOW_XML_FN="fv3gfs_aqm_wflow.xml"

AQM_RC_FN="aqm.rc"

AQM_CONFIG_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/aqm/epa/data"
AQM_BIO_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/aqm/bio"
AQM_BIO_FILE="BEIS_SARC401.ncf"
AQM_FIRE_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/emissions/GSCE/GBBEPx.in.C401/Reprocessed"
AQM_FIRE_FILE="GBBEPx_C401GRID.emissions_v003"
AQM_LBCS_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/LBCS/boundary_conditions_v4"
AQM_LBCS_FILES="gfs_bndy_chem_<MM>.tile7.000.nc"
AQM_GEFS_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/GEFS_aerosol"
NEXUS_INPUT_DIR="/scratch1/NCEPDEV/rstprod/nexus_emissions"
NEXUS_FIX_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/nexus/fix"
NEXUS_GRID_FN="grid_spec_GSD_HRRR_25km.nc"

DA_OBS_DIR="/scratch1/NCEPDEV/da/Cory.R.Martin/Datasets/Observations/RRFS-CMAQ"
AODPATH="/scratch1/BMC/wrfruc/hwang/viis/viirsaod2bufr/"
PMPATH="/scratch2/BMC/wrfruc/hwang/wf1/data/PM/anowpm_hourly"
FIXgsi="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/GSI/fix"
FIXcrtm="/scratch2/BMC/wrfruc/rli/WF1/fix/fix_crtm"
AIRCRAFT_REJECT="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/GSI/fix"
SFCOBS_USELIST="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/GSI/fix"
