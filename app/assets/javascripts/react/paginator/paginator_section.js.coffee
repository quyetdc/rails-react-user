# @cjsx React.DOM

@PaginatorSection = React.createClass
  displayName: 'PaginatorSection'
  _handleOnClick: (pageNumber) ->
    # use its own props as callback,
    # in order to allow its parent can handle and receive pageNumber
    @props.onPaginate(pageNumber)
  render: ->
    if @props.totalPages > 1
      <ul className="pagination">
        {
          for i in [1..@props.totalPages]
            <li key={i}>
              {
                if i == @props.currentPage
                  <span className="active">{i}</span>
                else
                  <PaginatorLink pageNumber={i} onPaginatorLinkClick={@_handleOnClick} />
              }
            </li>
        }
      </ul>
    else
      <div>&nbsp</div>