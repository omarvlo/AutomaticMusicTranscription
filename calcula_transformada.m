function A_tf = calcula_transformada(x, parameter)

blockSize = parameter.blockSize;
halfBlockSize = round(blockSize/2);
hopSize = parameter.hopSize;
winFunc = parameter.winFunc;
reconstMirror = parameter.reconstMirror;
appendFrame = parameter.appendFrame;


tf = fft(x,blockSize);

% if required, remove upper half of spectrum
if reconstMirror
tf = tf(1:blockSize/2+1);
end
A_tf = abs(tf);
%A_tf =A_tf/norm(A_tf);

%A_tf_n = A_tf / max(A_tf);