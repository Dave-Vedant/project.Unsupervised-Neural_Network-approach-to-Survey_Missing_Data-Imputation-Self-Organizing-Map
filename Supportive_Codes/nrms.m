function nrms (estimate, data)
r= sqrt (sum((estimate (:)-data (:)).^2))/sqrt(sum((data(:).^2)))
