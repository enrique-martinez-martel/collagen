% ***********************************************************************
% *  Date            Aug 25, 2020
% *  Authors         Geerit Kruis
% *
% *  Copyright (c) 2020 FFG Holdings Limited. All rights reserved
% ***********************************************************************

%% SimpleClientExample_Matlab

function SimpleClientExample_Matlab(solverExchangePath)
    % SimpleClientExample_Matlab
    % __solverExchangePath__ solver exchange path. Defaulting to the path of this file + /SimpleClientExample_Matlab/Baseline/SolverExchange
    if (nargin == 0)
        solverExchangePath = append(pwd , '/SimpleClientExample_Matlab/Baseline/SolverExchange');
    end
    
    % create a handle to the IClientManager
    clientManager = SixSigmaSDK.IClientManager.instance();
    
    % Show the current version of the clientManager
    disp(clientManager.versionString());
    
    % remove all existing IExchangeClients (just in case one was left over from a previous run
    clientManager.removeAll();
    
    % create an exchange client for csv files on the specified solverExchangePath
    exchangeClient = clientManager.create(SixSigmaSDK.ExchangeFormat.CSVFiles, solverExchangePath);
    
    % create an exchange client guard to make sure the exchange client is destroyed at the end of this function
    exchangeClientGuard = SixSigmaSDK.IExchangeClientGuard(exchangeClient);
    
    % create an entity editor to manipulate entities
    editor = SixSigmaSDK.Model.EntityEditor(exchangeClient);
    
    % initialize the SolverExchangeClient
    clientManager.initialize();
    

    while(true)
        % Simulation loop        
        % Get the current iteration from the client manager
        iteration = clientManager.getIteration();
        % get current Fan speed of ACU01
        curValue = editor.getFloatValue('Air Cooling Unit','ACU01',0,'Controls.Air Flow Controls.Fan Speed') ;
                
        if (mod(iteration, 20) == 0 || iteration == 21 || iteration == 22)
            % print the iteration and the current fan speed
            fprintf('%i\t%f\n',iteration, curValue);
        end
        if (iteration > 20)
            newValue = 100;
            % change the fan speed for ACU01
            editor.setFloatValue('Air Cooling Unit', 'ACU01',0, 'Controls.Air Flow Controls.Fan Speed',newValue);
        end
        
        % solve the next iteration
        clientManager.solveNext();
        if (~clientManager.isSolving()) 
            % If the client manager indicates we're no longer solving stop
            break;
        end
    end
    %terminte the client manager
    clientManager.terminate();
    % delete the exchangeclient guard and thus destroy the IExchangeClient 
    delete(exchangeClientGuard);
end