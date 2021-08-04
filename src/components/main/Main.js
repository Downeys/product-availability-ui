import { useState } from "react";

const Main = () => {
    const [serverStatus, setServerStatus] = useState("")

    const handleClick = () => {
        fetch(`http://3.138.183.109:31389/healthCheck`)
          .then((response) => response.text())
          .then((result) => setServerStatus(result))
          .catch(console.log)
    }

    return (
        <div>
            <button onClick={handleClick}>Check API Status</button>
            <p>{serverStatus}</p>
        </div>
    );
}

export default Main