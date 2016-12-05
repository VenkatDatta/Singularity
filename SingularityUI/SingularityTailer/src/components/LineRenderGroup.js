import React, { Component, PropTypes } from 'react';

import Line from './Line';

class LineRenderGroup extends Component {
  shouldComponentUpdate(nextProps) {
    return nextProps.lines.size !== this.props.lines.size
      || nextProps.lines.first().start !== this.props.lines.first().start
      || nextProps.lines.last().end !== this.props.lines.last().end;
  }

  renderLines() {
    return this.props.lines.map((data) => {
      return (
        <Line
          key={`${data.start}-${data.end}`}
          data={data}
          lineLinkRenderer={this.props.lineLinkRenderer}
        />
      );
    })
  }

  render() {
    return (
      <div className="render-group">
        {this.renderLines()}
      </div>
    );
  }
}

LineRenderGroup.propTypes = {
  lines: PropTypes.object.isRequired,
  lineLinkRenderer: PropTypes.func
};

export default LineRenderGroup;
