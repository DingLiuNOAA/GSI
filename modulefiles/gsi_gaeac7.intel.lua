help([[
]])

prepend_path("MODULEPATH", "/ncrc/proj/epic/spack-stack/c7/spack-stack-2.1.1/envs/ue-oneapi-2025.3.1/modules/Core")

local stack_python_ver=os.getenv("stack_python_ver") or "3.11.11"
local stack_oneapi_ver=os.getenv("stack_oneapi_ver") or "2025.3.1"
local stack_cray_mpich_ver=os.getenv("stack_cray_mpich_ver") or "9.2.0"
local cmake_ver=os.getenv("cmake_ver") or "3.31.11"
local crtm_fix_ver=os.getenv("crtm_fix_ver") or "3.1.2.0"

load(pathJoin("stack-intel-oneapi-compilers", stack_oneapi_ver))
load(pathJoin("cray-mpich", stack_cray_mpich_ver))
load(pathJoin("stack-cray-mpich", stack_cray_mpich_ver))
load(pathJoin("python", stack_python_ver))
load(pathJoin("cmake", cmake_ver))

load("gsi_common")

pushenv("GSI_BINARY_SOURCE_DIR", "/gpfs/f7/oar-reanalysis/world-shared/role.sfs.reanalysis/fix/gsi/20251105")
setenv("CRTM_FIX", pathJoin("/gpfs/f7/oar-reanalysis/world-shared/role.sfs.reanalysis/fix/crtm", "v" .. crtm_fix_ver))

setenv("CC","icx")
setenv("FC","ifx")
setenv("CXX","icpx")
pushenv("CRAYPE_LINK_TYPE","dynamic")

unload("cray-libsci")
whatis("Description: GSI environment on GaeaC7 with Intel Compilers")
