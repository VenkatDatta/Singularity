Requests = require './Requests'

class RequestsSearch extends Requests

    comparator: 'createdAt'

    url: => "#{ config.apiRoot }/history/requests/search?count=6&#{ $.param @params }&requestIdLike=#{ @query }"

    initialize: (models, { @query, @params }) =>

    parse: (requests) ->
        for request in requests
            request.originalObject = _.clone request
            request.id = request.request.id
            request.name = request.request.name ? request.request.id
            request.deployUser = (request.request.executorData?.env?.DEPLOY_USER ? '').split('@')[0]
            request.instances = request.request?.instances
            request.daemon = request.request?.daemon
            request.daemon = if _.isNull(request.daemon) then true else request.daemon
            request.timestamp = request.request?.timestamp
            request.timestampHuman = utils.humanTimeAgo request.timestamp
            request.createdAtHuman = utils.humanTimeAgo request.createdAt

        requests

module.exports = RequestsSearch
