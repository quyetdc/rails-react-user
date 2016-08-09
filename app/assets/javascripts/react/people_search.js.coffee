# @cjsx React.DOM

@PeopleSearch = React.createClass
  displayName: 'PeopleSearch'

  # submit handler
  _handleOnSubmit: (e) ->
    e.preventDefault()
    searchValue = @refs.search.getDOMNode().value.trim()
    @props.onFormSubmit(searchValue)

  render: ->
    <div className="row container"  style={{marginBottom: '50px'}} >
      <form onSubmit={@_handleOnSubmit} className="form-group">
        <div className="col-md-4">
          <input ref="search" placeholder="Search people" type="search" className="form-control"/>
        </div>

        <div className="col-md-8">
          <button type="submit" className="btn btn-primary"> Search </button>
        </div>

      </form>
    </div>