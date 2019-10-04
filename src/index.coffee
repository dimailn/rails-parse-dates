import {cloneDeep, set, get} from 'lodash'
import RecursiveIterator from 'recursive-iterator'

import moment from 'moment'


POSTFIXES = [
  'On'
  'At'
  'Till'
  'Date'
]

export default (entity) ->
  parsedEntity = {}

  iterator = new RecursiveIterator(entity)

  for {node, path} from iterator
    if (POSTFIXES.some((p) -> ///\w+#{p}///.test(path[path.length - 1]))) && typeof node is 'string'
      node = moment(node)
    set(parsedEntity, path, node)

  parsedEntity
