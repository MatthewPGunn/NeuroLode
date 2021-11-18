% eegplugin_Neurolode() - This plugin addeds a few analysis, exporting
%                          abilities, and processes created while working in INL
%                          process, made by Matthew Phillip Gunn in
%                          colaboration with the INL lab in Carbondale, IL.

function vers = eegplugin_Neurolode_v2021_WorkStation(fig, try_strings, catch_strings)

vers = '1.4';
% --- Neurolode 
ParentMenu = uimenu(fig, 'label', 'Neurolode');

% % % e_catch = 'catch, eeglab_error; LASTCOM= ''''; clear EEGTMP ALLEEGTMP STUDYTMP; end;';
% % % e_hist = [e_catch 'EEG = eegh(LASTCOM, EEG);'];
% % % catchstrs.add_to_hist = e_hist;

% NLodeGUI = uimenu (ParentMenu, 'label', 'Launch Neurolode GUI','callback', ...
%             ['[EEG com] = Export2Format(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);

CC = uimenu (ParentMenu, 'label', 'Common Commands');
        ReducePCA = uimenu (CC, 'label', 'Reduce PCA by 1','callback', ...
            ['[EEG com] = ReducePCAby1_v1a(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;eeglab redraw']); 
        Convert2Cont = uimenu (CC, 'label', 'Convert to Continuous','callback', ...
            ['[EEG com] = Convert2Continuous_v1a(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;eeglab redraw']); 
        EpochFileBundle = uimenu (CC, 'label', 'Convert to Epoch','callback', ...
            ['[EEG com] = EpochFile_v1a(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;eeglab redraw']); 

%Export0 is finished        
Export0 = uimenu (ParentMenu, 'label', 'Export Data','separator', 'on');
        ExportExcel = uimenu (Export0, 'label', 'As Excel','callback', ...
            ['[EEG com] = Export2Format(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        ExportDAT = uimenu (Export0, 'label', 'As DAT/Nscan','callback', ...
            ['[EEG com] = Export2Format(EEG,1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        ExportTXT = uimenu (Export0, 'label', 'As TXT','callback', ...
            ['[EEG com] = Export2Format(EEG,1,1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        sLORETA0 = uimenu (Export0, 'label', 'to sLORETA','callback', ...
            ['[EEG com]= eeglab2sloreta_v1a(EEG,1,1,1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        %ASCII_Export_29_Chan_only_v1a.m        %Compress2Folders.m        %eeglab2loreta.m       

% Need to find script
%         MaxPCA = uimenu (CC, 'label', 'Find Max stable PCA','callback', ...
%             ['[EEG com] = Export2Format(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);        
        
Analysis0 = uimenu (ParentMenu, 'label', 'Analysis');
    Spectral_Centroid0 = uimenu (Analysis0, 'label', 'Spectral Centroid');        
        uimenu( Spectral_Centroid0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Centroid_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Centroid0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Centroid_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Centroid0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Centroid_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
    Spectral_Spread0 = uimenu (Analysis0, 'label', 'Spectral Spread');        
        uimenu( Spectral_Spread0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Spread_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Spread0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Spread_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Spread0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Spread_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
    Spectral_Skewness0 = uimenu (Analysis0, 'label', 'Spectral Skewness');        
        uimenu( Spectral_Skewness0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Skewness_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Skewness0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Skewness_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Skewness0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Skewness_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
    Spectral_Kurtosis0 = uimenu (Analysis0, 'label', 'Spectral Kurtosis');        
        uimenu( Spectral_Kurtosis0, 'label', 'Time-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Kurtosis_Time(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Kurtosis0, 'label', 'Frequency-Domain','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Kurtosis_Freq(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
        uimenu( Spectral_Kurtosis0, 'label', 'Customize','callback', ...
                ['[EEG com]  = pop_EEG_Spectral_Kurtosis_Custom(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);

     Spectral_PowerOss0 = uimenu (Analysis0, 'label','Power Spectrum Oscillation','callback', ...
                ['[EEG com]  = pop_EEG_PowerSpectrumOss(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
 
Compare0 = uimenu (ParentMenu, 'label', 'Compare');
        FFT0 = uimenu (Compare0, 'label', 'FFT','callback', ...
                ['[EEG com]  = pop_CompareFFT(EEG, 1);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
                  
            
Processing = uimenu (ParentMenu, 'label', 'Processing');
          FFT0 = uimenu (Processing, 'label', 'Modifed BSS UI','callback', ...
                ['[EEG com]  = pop_autobssemgNL(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
            
            

% %Everything above is finished
% ManualCleaning = uimenu (ParentMenu, 'label', 'Manual Cleaning');
%         ManualCleaning0 = uimenu (ManualCleaning, 'label', 'Interpolate By Component Scroll','callback', ...
%             ['[EEG com] = Export2Format(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%         ManualCleaning1 = uimenu (ManualCleaning, 'label', 'Interpolate By Data Scroll','callback', ...
%             ['[EEG com] = Export2Format(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);           
%             
%             
% Compare0 = uimenu (ParentMenu, 'label', 'Compare');
%     Spectral_Centroid0 = uimenu (Compare0, 'label', 'Spectral Centroid');        
%         uimenu( Spectral_Centroid0, 'label', 'Time-Domain','callback', ...
%                 ['com = EEG_Spectral_Centroid_v1a(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%         uimenu( Spectral_Centroid0, 'label', 'Frequency-Domain','callback', ...
%                 ['com = EEG_Spectral_Centroid_v1a(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%         uimenu( Spectral_Centroid0, 'label', 'Customize','callback', ...
%                 ['com = EEG_Spectral_Centroid_v1a(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%             
%        uimenu( Analysis0, 'label', 'ERP','callback', ...
%                 ['com = Compare_Process_Stim_Types__NEG_vs_NEG_v1a(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%                 %Compare_Process_Stim_Types__NEG_vs_NEG_v1a.m
%         uimenu( Analysis0, 'label', 'Cross-Coherence','callback', ...
%                 ['com = FreqBinValue_ExcelExport_v1a(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%                 %FreqBinValue_ExcelExport_v1a.m
%         uimenu( Analysis0, 'label', 'Time-Coherence','callback', ...
%                 ['com = FreqBinValue_ExcelExport_v1a(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%                 %FreqBinValue_ExcelExport_v1a.m
%         uimenu( Analysis0, 'label', 'FFT','callback', ...
%                 ['com = pop_eegplot_w3(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);    
%                 %Difference_Between_FFTs_Combine_FFT_Plots_v1a_pngs.m
%                 %GUI_FFT_Mean_Median_MaxPeak_v7a
%                 %GUI_FFTMedian_only_Pz_O1_O2 (1)
%         uimenu( Analysis0, 'label', 'Asymmetry','callback', ...
%                 ['com = pop_eegplot_w3(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);  
%                 %AsymGUI_v3a_Test.m
%         uimenu( Analysis0, 'label', 'Frequency Ratio','callback', ...
%                 ['com = FFT_Ratio_BHZ_divHZ_Output_081120_0221(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%                 %FFT_Ratio_BHZ_divHZ_Output_081120_0221.m
%         uimenu( Analysis0, 'label', 'ERP Ratio','callback', ...
%                 ['com = FFT_Ratio_BHZ_divHZ_Output_081120_0221(EEG, 1, 1, 1);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%                 %FFT_Ratio_BHZ_divHZ_Output_081120_0221.m
%         uimenu( Analysis0, 'label', 'Data Scroll','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %GUI_ERP_Export_BMP_v2a.m
%         uimenu( Analysis0, 'label', 'Component Scroll','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %GUI_ERP_Export_BMP_v2a.m
%                 
% Processing0 = uimenu (ParentMenu, 'label', 'Processing');
%         uimenu( Processing0, 'label', 'Max Stable PCA','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Dynamic_Mirror_and_Complex_Comp_Correcter_v2a.m
%         uimenu( Processing0, 'label', 'Alternative Channel Interpolation','callback', ...
%                 ['[EEG com] = GUI_29Chan_Cap_Outter_Ring_Interploation_v2b(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']); 
%                 %GUI_29Chan_Cap_Outter_Ring_Interploation_v2b.m
%         AutomatedInterpolation0 = uimenu (Processing0, 'label', 'Automated Interpolation');
%             uimenu( AutomatedInterpolation0, 'label', 'For Channels','callback', ...
%                     ['com = SCI_LocalCorr1(EEG , Channels,);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);']);
%                     %SCI_LocalCorr1.m 
%                     %SCI_LocalCorr.m
%             uimenu( AutomatedInterpolation0, 'label', 'For Components','callback', ...
%                     ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                     %SCI_LocalCorr1.m 
%                     %SCI_LocalCorr.m
%         uimenu( Processing0, 'label', 'Wave Format Detection','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Idealistic_Comp_Removal_v2a.m
%         uimenu( Processing0, 'label', 'Idealized Component Analysis','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Idealistic_Comp_Removal_v2a.m
%         uimenu( Processing0, 'label', 'Trim Data','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Idealistic_Comp_Removal_v2a.m
% Batch0 = uimenu (ParentMenu, 'label', 'Batch');
%         uimenu( Batch0, 'label', 'Print Figure','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %GUI_ERP_Export_BMP_v2a.m
%         uimenu( Batch0, 'label', 'Max Peak Amplitude','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %GUI_Excel_Outputer_RT_AmpPeak_NoOss_Oddball_v8a.m
%         uimenu( Batch0, 'label', 'Mean Amplitude','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %GUI_Excel_Outputer_RT_AmpPeak_NoOss_Oddball_v8a.m
%         uimenu( Batch0, 'label', 'Total Power','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %GUI_FFT_Mean_Median_MaxPeak_v7a
%         uimenu( Batch0, 'label', 'Channel Average','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Selected_Chan_ERP_v1a.m
%         uimenu( Batch0, 'label', 'Basic Information','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Basic_Information_v1a.m
%         uimenu( Batch0, 'label', 'Freqeuncy Band','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %FREQ_BAND.m
%         uimenu( Batch0, 'label', 'Append and Offset','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %Appending_Offset_v1a.m
%                 
% Stats0 = uimenu (ParentMenu, 'label', 'Statistics');
%         LostHelp = uimenu (Stats0, 'label', 'What Analysis Should I Run?');
%             OneDepVar = uimenu( LostHelp, 'label', 'One Dependent Variable');
%                 OneDepVarNoIndep = uimenu( OneDepVar, 'label', 'NO Independent Variable');
%                     uimenu( OneDepVarNoIndep, 'label', 'One-sample t-test');
%                     uimenu( OneDepVarNoIndep, 'label', 'One-Sample Median');
%                     uimenu( OneDepVarNoIndep, 'label', 'Binomial test');
%                     uimenu( OneDepVarNoIndep, 'label', 'Chi-Squre Goodness of Fit');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '1 IV with 2 levels (independent groups)');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '1 IV with 2 or more levels (independent groups)');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '1 IV with 2 levels (dependent/matched groups)');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '1 IV with 2 or more levels (dependent/matched groups))');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '2 or more IVs (independent groups)');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '1 interval IV');
% 
%                 PlaceHold = uimenu( OneDepVar, 'label', '1 or more interval IVs and/or 1 or more categorical IVs');
% 
%              TwoDepVar = uimenu( LostHelp, 'label', 'Two Dependent Variable');
%             
%                  PlaceHold = uimenu( TwoDepVar, 'label', '1 IV with 2 or more levels (independent groups)');
% 
%              
%         uimenu( Stats0, 'label', 'Load Data','separator', 'on', 'callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);               
%         uimenu( Stats0, 'label', 'One Sample t-test','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);               
%         uimenu( Stats0, 'label', 'Binomial Test','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Chi-Squre Goodness of Fit','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Two Indep. Sample T-test','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'One-way ANOVA','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Paired T-Test','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'One-Way Repeated measures ANOVA','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Logistic Regression','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Factorial ANOVA','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Correlation','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Simple Linear Regression','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Multiple Regression','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Multiple Logistic Regression','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( Stats0, 'label', 'Analysis of covariance','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                                                                                                
%             
% ComponetDownload0 = uimenu (ParentMenu, 'label', 'Download and Upload','separator', 'on');
%             uimenu( ComponetDownload0, 'label', 'Download Component Library','callback', ...
%                     ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%             uimenu( ComponetDownload0, 'label', 'Added to Component Library','callback', ...
%                     ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
% 
% PlaceHolder01 = uimenu (ParentMenu, 'label', 'Add deleted data to Library','callback',...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
% 
%             
%             
% PossibleProblems0 = uimenu (ParentMenu, 'label', 'Possible Problem');
%         uimenu( PossibleProblems0, 'label', 'Channel Based','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( PossibleProblems0, 'label', 'Component Based','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         %Dynamic_Mirror_and_Complex_Comp_Correcter_v2a.m
% 
% MachineLearning0 = uimenu (ParentMenu, 'label', 'Machine Learning','separator', 'on');
%         uimenu( MachineLearning0, 'label', 'Start Profile','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( MachineLearning0, 'label', 'End Profile','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( MachineLearning0, 'label', 'Save Profile','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%         uimenu( MachineLearning0, 'label', 'Run Profile','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
% 
% neuroengineering0 = uimenu (ParentMenu, 'label', 'Neuroengineering - Testing','separator', 'on');
%         uimenu( neuroengineering0, 'label', 'DO NOT USE','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);               
% LearningYoutube0 = uimenu (ParentMenu, 'label', 'Youtube Series','separator', 'on');
%         uimenu( LearningYoutube0, 'label', 'DO NOT USE','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %command_cheat_sheet_v1a.m
% 
% Parallel_0 = uimenu (ParentMenu, 'label', 'Convert EEGlab For Parallel Processing','separator', 'on');
%         uimenu( Parallel_0, 'label', 'DO NOT USE','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %command_cheat_sheet_v1a.m
% Parallel_1 = uimenu (ParentMenu, 'label', 'Convert Script for Parallel processing');
%         uimenu( Parallel_1, 'label', 'DO NOT USE','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
%                 %command_cheat_sheet_v1a.m
% % Parallel_2 = uimenu (ParentMenu, 'label', 'Convert EEGlab For Parallel processing');
% %         uimenu( Parallel_2, 'label', 'DO NOT USE','callback', ...
% %                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);
% %                 %command_cheat_sheet_v1a.m
% 
% SuperPC = uimenu (ParentMenu, 'label', 'Convert Script to BigDAWG');
%         uimenu( Stats0, 'label', 'DO NOT USE','callback', ...
%                 ['[EEG com] = SCI_LocalCorr1(EEG);;EEG = eegh(com, EEG);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = pop_newset(ALLEEG, EEG, CURRENTSET);;[ALLEEG EEG CURRENTSET] = eeg_store(ALLEEG, EEG, CURRENTSET)']);                   
 end