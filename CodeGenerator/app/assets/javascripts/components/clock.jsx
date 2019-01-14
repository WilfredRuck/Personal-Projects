class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = { time: new Date().toTimeString().slice(0,9) };
    this.tick = this.tick.bind(this);
  }

  render() {
    return (
      <div className="clock">
        <p>{this.state.time}</p> 
        {/* <br/>
        <p>Date: {this.state.date}</p> */}
      </div>
      );
    }
    componentDidMount() {
      this.tick();
      this.inerval = setInterval(this.tick, 1000);
    }
    componentWillUnmount() {
      clearInterval(this.interval);
    }
    
    tick() {
      let timeParts = this.state.time.split(/[\s:]+/);
      let seconds = parseInt(timeParts[2]);
      let minutes = parseInt(timeParts[1]);
      let hours = parseInt(timeParts[0]);
      const timeZone = timeParts[3];
      seconds += 1;
      
      if (seconds === 60) {
        seconds = 0;
        minutes += 1;
      }
      if (minutes === 60 ) {
        minutes = 0;
        hours += 1;
      }
      if (hours === 24 ) {
        hours = 0;
      }
      let newTime = hours.toString() + ":" + minutes.toString() + ":" + seconds.toString() + " " + timeZone;
      this.setState( {time: newTime})
    }
      
      // setInterval(tick(), 1000);
  }