function figure_error(result, ts)
    result_data = getElement(result.logsout, 'y').Values;
    
    px_result = result_data.px.Data;
    py_result = result_data.py.Data;
    theta_result = result_data.theta.Data;
    r_result = result_data.r.Data;
    beta_result = result_data.beta.Data;
    V_result = result_data.V.Data;
    
    result_mat = [px_result, py_result, theta_result, r_result, beta_result, V_result];
    
    px_ref2 = getElement(result.logsout, 'ref2').Values.px.Data;
    py_ref2 = getElement(result.logsout, 'ref2').Values.py.Data;
    
    error_px = abs(px_ref2(1:110/ts) - px_result(2:110/ts+1));
    error_py = abs(py_ref2(1:110/ts) - py_result(2:110/ts+1));
    error_dist = sqrt(error_px.^2 + error_py.^2);
    time = (0:ts:110)';
    
    % 誤差を図示
    figure;
    plot(time(1:end-1), error_dist);
    disp("rmse")
    disp(mean(error_dist))
    xlabel('Time(sec)');
    ylabel('Error(m)');
    title('Time Series Error');
    grid on;
end