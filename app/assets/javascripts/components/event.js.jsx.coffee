class @Event extends React.Component
  @propTypes =
    title: React.PropTypes.string

  render: ->
    `<div>
      <div>Title: {this.props.title}</div>
    </div>`
