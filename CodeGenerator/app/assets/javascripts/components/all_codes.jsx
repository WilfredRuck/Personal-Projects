class AllCodes extends React.Component {
  constructor(props) {
    super(props);
    this.state = { 
      codes: this.props.codes
    };
  }

  copyCode(code) {
    debugger
    clipboard.writeText(code);
  }

  render() {
    const lis = this.props.codes.map((code) => {
      return (
        <li className="usedCode" onClick={this.copyCode.bind(this.target, code.code)} key={code.id}>{code.code}</li>
      );
    })
    return(
      <ul className="usedSection">{lis}</ul>
    )
  }
}