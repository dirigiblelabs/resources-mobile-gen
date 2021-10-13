class NSWorker {

    constructor(script) {
        this.script = script;
        this.onerror = null;
        this.onmessage = null;
        this.onmessageerror = null;
        this.execute();
    }

    postMessage(msg) {
        if (window && window.webkit) {
            window.webkit.messageHandlers.postMessageListener.postMessage(msg);
        } else {
            console.log("No webkit")
        }
    }

    execute() {
        if (window && window.webkit) {
            window.webkit.messageHandlers.executor.postMessage(this.script);
        } else {
            console.log("No webkit")
        }
    }

    terminate() {
        if (window && window.webkit) {
            window.webkit.messageHandlers.terminator.postMessage(this.script);
        } else {
            console.log("No webkit")
        }
    }

}

let onNativeMessage = function(msg) {
    console.log("Message from native: " + msg)
}