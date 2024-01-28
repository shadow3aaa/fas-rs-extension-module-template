--
-- 中文:
-- 该枚举对应的lua函数
-- 在 fas-rs 中将被 fas-rs 回调
-- pub enum CallBacks {
-- LoadFas(pid_t), --------> function load_fas(pid)
-- UnloadFas(pid_t), ------> function unload_fas(pid)
-- StartFas, --------------> function start_fas()
-- StopFas, ---------------> function stop_fas()
-- InitCpuFreq, -----------> function init_cpu_freq()
-- WriteCpuFreq(usize), ---> function write_cpu_freq(freq)
-- ResetCpuFreq, ----------> function reset_cpu_freq()
-- }
--
-- function load_fas(pid):
-- 当 fas-rs 加载到目标游戏时调用，
-- 参数为目标应用程序的pid。
--
-- function unload_fas(pid)
-- 当 fas-rs 卸载到目标游戏时调用，
-- 参数为目标应用程序的pid。
--
-- function start_fas()
-- 切换到fas-rs工作状态时调用。
--
-- function stop_fas()
-- 切换到 fas-rs 不工作状态时调用。
--
-- function init_cpu_freq()
-- 当cpu控制器进入控制状态时调用。
--
-- function write_cpu_freq(freq)
-- 当cpu控制器写入cpu频率时调用，
-- 参数是正在写入的频率。
--
-- function reset_cpu_freq()
-- 当cpu控制器退出控制状态时调用。
--
-- 附加: 在函数外的lua代码会在插件加载时被执行，
-- 如果你有执行初始化内容的需求，这样做很方便。
--
-- ------------------------------------
--
-- EN:
-- The lua function corresponding to this enumeration
-- in fas-rs will be called back by fas-rs
-- pub enum CallBacks {
--    LoadFas(pid_t), --------> function load_fas(pid)
--    UnloadFas(pid_t), ------> function unload_fas(pid)
--    StartFas, --------------> function start_fas()
--    StopFas, ---------------> function stop_fas()
--    InitCpuFreq, -----------> function init_cpu_freq()
--    WriteCpuFreq(usize), ---> function write_cpu_freq(freq)
--    ResetCpuFreq, ----------> function reset_cpu_freq()
-- }
--
-- function load_fas(pid):
-- Called when fas-rs is loaded into the target game,
-- the parameter is the pid of the target application.
--
-- function unload_fas(pid)
-- Called when fas-rs is unloaded into the target game,
-- the parameter is the pid of the target application.
--
-- function start_fas()
-- Called when switching to fas-rs working state.
--
-- function stop_fas()
-- Called when switching to fas-rs not-working state.
--
-- function init_cpu_freq()
-- Called when the cpu controller enters the control state.
--
-- function write_cpu_freq(freq)
-- Called when the cpu controller writes the cpu frequency,
-- the parameter is the frequency being written.
-- 
-- function reset_cpu_freq()
-- Called when the cpu controller exits the control state.
--
-- Extra: Lua code outside the function will be
-- executed when the plug-in is loaded, if you need to
-- execute initialization content, this is convenient.
--

log_debug("hello world") -- Initial

function start_fas() -- A example for callback functions
    log_info("fas started")
end
