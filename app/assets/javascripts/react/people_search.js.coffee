# @cjsx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  propTypes:
    onChange: React.PropTypes.func

  # submit handler
  #  _handleOnSubmit: (e) ->
  #    e.preventDefault()
  #    searchValue = @refs.search.getDOMNode().value.trim()
  #    @props.onFormSubmit(searchValue)

  _handleOnChange: (e) ->
    e.preventDefault()
    searchValue = e.target.value.trim()
    console.log(searchValue)
    @props.onFormSubmit(searchValue)

  render: ->
    <div className="row container"  style={{marginBottom: '50px'}} >
      <form onSubmit={@_handleOnSubmit} className="form-group">
        <div className="col-md-4">
          <input ref="search" placeholder="Search people" type="search" className="form-control" onChange={@_handleOnChange}/>
        </div>
      </form>
    </div>