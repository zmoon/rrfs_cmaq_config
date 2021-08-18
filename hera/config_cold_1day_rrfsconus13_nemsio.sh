MACHINE="hera"
ACCOUNT="naqfc"
EXPT_SUBDIR="test_cmaq_conus13"

PRINT_ESMF="FALSE"

RUN_ENVIR="community"
PREEXISTING_DIR_METHOD="rename"

USE_CRON_TO_RELAUNCH="TRUE"
CRON_RELAUNCH_INTVL_MNTS="3"

FCST_MODEL="fv3gfs_aqm"

PREDEF_GRID_NAME="RRFS_CONUS_13km"
GRID_GEN_METHOD="ESGgrid"
HALO_BLEND="0"

CCPP_PHYS_SUITE="FV3_GFS_2017_gfdlmp"
FCST_LEN_HRS="24"
LBC_SPEC_INTVL_HRS="6"

DATE_FIRST_CYCL="20190801"
DATE_LAST_CYCL="20190801"
CYCL_HRS=( "12" )

WTIME_RUN_FCST="01:00:00"

RUN_TASK_ADD_AQM_LBCS="TRUE"
RUN_TASK_RUN_NEXUS="TRUE"
RUN_TASK_RUN_POST="FALSE"

RUN_ADD_AQM_CHEM_LBCS="TRUE"
RUN_ADD_AQM_GEFS_LBCS="TRUE"
AQM_GEFS_CYC="00"

FV3_EXEC_FN="NEMS.x"
FV3_NML_BASE_SUITE_FN="input.nml.fv3gfs_aqm_FV3_GFS_2017_gfdlmp"
FV3_NML_YAML_CONFIG_FN="fv3gfs_aqm.input.yml"
WFLOW_XML_FN="fv3gfs_aqm_wflow.xml"

DT_ATMOS="180"
LAYOUT_X="33"
LAYOUT_Y="8"
BLOCKSIZE="29"

AQM_CONFIG_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/aqm/epa/data"
AQM_BIO_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/aqm/bio"
AQM_BIO_FILE="BEIS_RRFScmaq_C775.ncf"
AQM_FIRE_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/emissions/GSCE/GBBEPx.in.C775/Reprocessed"
AQM_FIRE_FILE="GBBEPx_all13kmGRID.emissions_v003"
AQM_LBCS_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/LBCS/RRFS_CONUS_13km_no_blending"
AQM_LBCS_FILES="gfs_bndy_chem_<MM>.tile7.000.nc"
AQM_GEFS_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/GEFS_aerosol"
NEXUS_INPUT_DIR="/scratch1/NCEPDEV/rstprod/nexus_emissions"
NEXUS_FIX_DIR="/scratch2/NCEPDEV/naqfc/RRFS_CMAQ/nexus/fix"
NEXUS_GRID_FN="grid_spec_RRFS_CONUS_13km.nc"
