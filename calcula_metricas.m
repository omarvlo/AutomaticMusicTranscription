function metricas = calcula_metricas(reconocido, original)

fp = 0;
tp = 0;
fn = 0;
temporal = 0;


[y long_rec] = size(reconocido);
[x long_orig] = size(original);

for i=1:1:y
    
    long_rec_wz = 0;
    long_orig_wz = 0;
    fp_temporal = 0;
    fn_temporal = 0;
    tp_temporal = 0;
    
    for l=1:1:long_rec
        if ((reconocido(i,l))>0)
            long_rec_wz=long_rec_wz+1;
        end
    end
    
    for m=1:1:long_orig
        if ((original(i,m))>0)
            long_orig_wz=long_orig_wz+1;
        end
    end
    
    temporal = original(i,:);
    
    for j=1:1:long_orig
        
        for k=1:1:long_rec
            if (reconocido(i,k) == temporal(j)&&(reconocido(i,k)~=0))
                tp_temporal = tp_temporal + 1;
                temporal(j) = 0;
            end
        end
        fp_temporal = long_rec_wz - tp_temporal;
        fn_temporal = long_orig_wz - tp_temporal;
    end
    
    fp = fp + fp_temporal;
    fn = fn + fn_temporal;
    tp = tp + tp_temporal;

end

precision = (tp/(tp+fp))*100;
recall = (tp/(tp+fn))*100;
accuracy = (tp/(tp+fp+fn))*100;
f_measure = (2*precision*recall)/(precision + recall);

metricas = [precision recall accuracy f_measure];