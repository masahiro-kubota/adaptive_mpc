function transformedState = transformState(referenceState, inputState)
    % 基準となる状態referenceStateを原点座標として、入力した他の状態inputStateを変換
    px_ref = referenceState(1);
    py_ref = referenceState(2);
    theta_ref = referenceState(3);

    px = inputState(1);
    py = inputState(2);
    theta = inputState(3);
    r = inputState(4);
    beta = inputState(5);
    V = inputState(6);
    
    
    
    R = [cos(theta_ref), sin(theta_ref);
         -sin(theta_ref), cos(theta_ref)];
    transformedState = [R * [px - px_ref; py - py_ref]; 
                        theta - theta_ref;
                        r;
                        beta + theta - theta_ref;
                        V];
end