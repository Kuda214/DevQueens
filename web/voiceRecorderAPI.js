var audioRecorder = {
    
    audioBlobs: [],/*of type Blob[]*/
    
    mediaRecorder: null, /*of type MediaRecorder*/
    
    streamBeingCaptured: null, /*of type MediaStream*/
    /** Start recording the audio 
     * @returns {Promise} - returns a promise that resolves if audio recording successfully started
     */
    start: function () {
        if (!(navigator.mediaDevices && navigator.mediaDevices.getUserMedia)) {
            return Promise.reject(new Error('mediaDevices API or getUserMedia method is not supported in this browser.'));
        }

        else {
            return navigator.mediaDevices.getUserMedia({ audio: true }/*of type MediaStreamConstraints*/)
                .then(stream  => {

                    audioRecorder.streamBeingCaptured = stream;

                    audioRecorder.mediaRecorder = new MediaRecorder(stream); 

                    audioRecorder.audioBlobs = [];

                    audioRecorder.mediaRecorder.addEventListener("dataavailable", event => {
                        audioRecorder.audioBlobs.push(event.data);
                    });

                    audioRecorder.mediaRecorder.start();
                });

        }
    },
    /** Stop the started audio recording
     * @returns {Promise} - returns a promise that resolves to the audio as a blob file
     */
    stop: function () {
        return new Promise(resolve => {
            let mimeType = audioRecorder.mediaRecorder.mimeType;

            audioRecorder.mediaRecorder.addEventListener("stop", () => {
                let audioBlob = new Blob(audioRecorder.audioBlobs, { type: mimeType });
                
                resolve(audioBlob);
            });
            audioRecorder.cancel();
        });
    },
    /** Cancel audio recording*/
    cancel: function () {
        audioRecorder.mediaRecorder.stop();

        audioRecorder.stopStream();

        audioRecorder.resetRecordingProperties();
    },
    stopStream: function () {
        audioRecorder.streamBeingCaptured.getTracks() //get all tracks from the stream
            .forEach(track  => track.stop()); //stop each one
    },
    resetRecordingProperties: function () {
        audioRecorder.mediaRecorder = null;
        audioRecorder.streamBeingCaptured = null;
    }
}