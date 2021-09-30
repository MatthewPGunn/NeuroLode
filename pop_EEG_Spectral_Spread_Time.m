%function [EEG, com] = pop_EEG_Spectral_Spread_Time(EEG,COI,AverageChannelsCheck,ExportData,GUIOnOff)
%                      - This function organizes EEG data to uses to use
%                      matlab's spectralSpread and is set-up to view data
%                      in the time domain.
%
%
% Usage:
%   >>  pop_EEG_Spectral_Spread_Time(EEG,COI,AverageChannelsCheck,ExportData,GUIOnOff)
%
% Inputs:
%   EEG                           - Input dataset.
%   CoI                           - List of channels to average.
%   AverageChannelsCheck          - If set to 1 will average all epochs Input dataset.
%   ExportData                    - If set to 1 will export file as excel. If this fails will try to save as .dat.
%   GUIOnOff                      - Used to skip GUI inputs if using in another function. If
%                                   GUIOnOff doesn't exsist it will run the GUI
%
%
% Author: Matthew Phillip Gunn
%
% See also:
%   eeglab , spectralSpread

% Copyright (C) 2021  Matthew Gunn, Southern Illinois University Carbondale, neurolode@gmail
%
% Redistribution and use in source and binary forms, with or without
% modification, are permitted provided that the following conditions are met:
%
% 1. Redistributions of source code must retain the above copyright notice,
% this list of conditions and the following disclaimer.
%
% 2. Redistributions in binary form must reproduce the above copyright notice,
% this list of conditions and the following disclaimer in the documentation
% and/or other materials provided with the distribution.
%
% THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
% AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
% IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
% ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
% LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
% CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
% SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
% INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
% CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
% ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
% THE POSSIBILITY OF SUCH DAMAGE.
function [EEG, com] = pop_EEG_Spectral_Spread_Time(EEG,COI,AverageChannelsCheck,ExportData,GUIOnOff)
com = '';
if nargin < 1
    help pop_EEG_Spectral_Spread_Time;
    return;
end
Type = 'TimeDomain';
if exist('GUIOnOff') == 0
    %Spectral Spread of Time-Domain
    NumberOfFieldsAndFieldSpace = [.75 1 1];
    Title = { { 'style' 'text' 'string' 'Spectral Spread - Time Domain' 'fontweight' 'bold' } ...
        {} ...
        {  'style' 'text' 'string' '' } ...
        {  'style' 'text' 'string' '' }};
    Mo1  = { { 'style' 'text' 'string' 'Channels of Interest' } ...ed
        { 'style' 'edit' 'string',''} ...
        { 'style' 'text' 'string' ' Ex "1:5", plot channels 1:5 or average them if above box is checked' } };
    Mo2  = { { 'style' 'text' 'string' 'Average Channels' } ...
        { 'style' 'checkbox' 'string',''} ...
        { 'style' 'text' 'string' 'Average above channels' } };
    Mo3  = { { 'style' 'text' 'string' 'Export Data' } ...
        { 'style' 'checkbox' 'string',''} ...
        { 'style' 'text' 'string' 'Export as Excel with time across the top' } };
    allGeom = { 1 NumberOfFieldsAndFieldSpace };
    Title = [ Title(:)' Mo1(:)'];
    allGeom{end+1} = NumberOfFieldsAndFieldSpace;
    Title = [ Title(:)' Mo2(:)'];
    allGeom{end+1} = NumberOfFieldsAndFieldSpace;
    Title = [ Title(:)' Mo3(:)'];
    allGeom{end+1} = NumberOfFieldsAndFieldSpace;
    res = inputgui(allGeom, Title);
    if isempty(res)
        return
    end
    % Formating GUI input for channels for matlab - Start
    COI = strrep(res(1,1),' ',',');
    COI = strrep(COI,' ','');
    Temp = [cellfun(@(cIn) strsplit(cIn,',')',COI,'UniformOutput',false)]';
    COI_Comma1 = [Temp{:}];
    COI_Find_Colon1 =  strfind(COI_Comma1,':');
    % Formating GUI input for channels for matlab - End
    AverageChannelsCheck = cell2mat(res(1,2));
    ExportData = cell2mat(res(1,3));
else
    COI = convertCharsToStrings(COI);
    COI = strrep(COI,' ',',');
    COI = strrep(COI,' ','');
    Temp = [cellfun(@(cIn) strsplit(cIn,',')',COI,'UniformOutput',false)]';
    COI_Comma1 = [Temp{:}];
    COI_Find_Colon1 =  strfind(COI_Comma1,':');
    % Formating GUI input for channels for matlab - End
    AverageChannelsCheck = AverageChannelsCheck;
    ExportData = ExportData;
end
%%%%%%%%%%%%%% Formatting - Start
COI_List = [];
for ii=1:size(COI_Find_Colon1)
    if COI_Find_Colon1{ii,1} > 0
        TempN1 = [str2double(COI_Comma1{ii,1}(1:(COI_Find_Colon1{ii,1}-1))):str2double(COI_Comma1{ii,1}((COI_Find_Colon1{ii,1}+1):end))]';
        COI_List(((end+1:end+size(TempN1,1))),1) = TempN1;
    else
        COI_List(end+1,1) = str2double(COI_Comma1{ii,1});
    end
end
%%%%%%%%%%%%%% Formatting - End

NewEEG = EEG.data(COI_List,:,:);
if size(NewEEG,3)>1
    NewEEG = mean(NewEEG,3);
    %NewEEG = reshape(NewEEG , size(NewEEG,1),size(NewEEG,2)*size(NewEEG,3));
end
if AverageChannelsCheck == 1
    NewEEG = mean(NewEEG,1);
    Type = strcat(Type, 'AvgChan');
end
NewEEG = NewEEG';

NewEEGlist = [];
for qs=1:size(NewEEG,2)
    %Time-Domain Audio - General Over averaged epoch
    SS = spectralSpread(NewEEG(:,qs),EEG.srate);
    NewEEGlist = [NewEEGlist SS];
end


%Plotting
if exist('GUIOnOff') == 0
    %Everything works above
    t = linspace(EEG.xmin,EEG.xmax,size(SS,1));
    figure;
    plot(t,NewEEGlist)
    xlabel('Time (s)')
    ylabel('Spread (Hz)')
    Clabels = cell(size(COI_List,1),1);
    for w=1:size(COI_List,1)
        Clabels{w,1} = convertCharsToStrings(EEG.chanlocs(COI_List(w,1)).labels);
    end
    legend(Clabels,...
        'Location','northwest','NumColumns',2)
end
%Export Data
if ExportData == 1
    t = datestr(now, 'mm_dd_yyyy-HHMM');
    t = string(t);
    t = t(1,1);
    NewEEGlist = NewEEGlist';
    COI_List01 =string('');
    for a=1:size(COI_List,1)
        COI_List01 =  strcat(COI_List01,'_', string(COI_List(a,1)));
    end
    Filename = strcat('_SpectralSpread_', 'Chans',COI_List01,'_',Type);
    Report_Name = strcat(EEG.filename(1:end-4),Filename,'.xlsx');
    try
        g =table(NewEEGlist);
        writetable(g,Report_Name,'WriteVariableNames',false);
    catch
        Report_Name = char(Report_Name);
        Report_Name = strcat(Report_Name(1:end-5),'.dat');
        writecell(NewEEGlist,Report_Name);
        eeglab redraw
    end
end
if exist('GUIOnOff') == 0
    regions = [res(1,1) res(1,2) res(1,3) 1]; %Time
    com = sprintf('EEG = pop_EEG_Spectral_Spread_Time(EEG,%s);', vararg2str(regions));
end