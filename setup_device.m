H = dsp.AudioRecorder;
H.DeviceName = 'STM32 AUDIO Streaming in FS Mod: USB Audio (hw:1,0)';
H.NumChannels = 10;
H.SampleRate = 48e3;


AFW = dsp.AudioFileWriter('myspeech.wav','FileFormat', 'WAV','SampleRate',48000);
disp('Speak into microphone now');
tic;
while toc < 5
  [audioIn] = H();
  AFW(audioIn);
end
release(AFW)

disp('Speak into microphone now (PART II)');


AFW = dsp.AudioFileWriter('myspeech2.wav','FileFormat', 'WAV','SampleRate',48000);
disp('Speak into microphone now');
tic;
while toc < 5
  [audioIn] = H();
  AFW(audioIn);
end
release(AFW);
disp('Recording complete');

disp('Recording complete');





release(H);
