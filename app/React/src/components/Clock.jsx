import React from "react";
export default function Clock() {
    const [date, setDate] = React.useState(new Date());
    let timerID = null;
    //* Use Effect
    React.useEffect(() => {
        // Here goes the code you wish to run on mount
        timerID = setInterval(() => setDate(new Date()), 1000 * 60);
    
        return () => {
            // Here goes the code you wish to run on unmount
            clearInterval(timerID);
        }
    }, []);
    // React.useEffect(() => { console.log("---- Mounted ----"); }, []);  //* Another way for Mount Effect
    // React.useEffect(() => () => { console.log("---- Unmounted ---- "); }, []);  //* Another way for Unmount Effect
    return (
        
        <h2>{date.toLocaleTimeString()}</h2>
    );
}