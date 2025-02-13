function UnitTestsAll()
global logger
global cfg 
t_local = tic;

setNamespace('Homer3')

CleanUp(true);

cleanupObj = onCleanup(@()userInterrupt_Callback(true));

logger = Logger('UnitTestsAll');
cfg = ConfigFileClass();

cfg.SetValue('Regression Test Active','true');

cfg.SetValue('Include Archived User Functions','Yes');
cfg.SetValue('Default Processing Stream Style','NIRS');
cfg.Save();
% UnitTestsAll_Nirs(false);

cfg.SetValue('Default Processing Stream Style','SNIRF');
cfg.Save();
UnitTestsAll_Snirf(false);
UnitTestsAll_MainGUI(false)

toc(t_local);



% ---------------------------------------------------
function userInterrupt_Callback(standalone)
fprintf('UnitTestsAll cleaning\n')
userInterrupt(standalone)


