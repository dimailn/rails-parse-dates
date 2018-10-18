import {cloneDeep, set, get} from 'lodash'
import RecursiveIterator from 'recursive-iterator'

import moment from 'moment'


POSTFIXES = [
  'At'
  'Date'
]

export default (entity) ->
  parsedEntity = {}

  iterator = new RecursiveIterator(entity)

  for {node, path} from iterator
    if (/\w+At/.test(path[path.length - 1]) || path[0] is 'registrationDate') && typeof node is 'string'
      node = moment(node)
    set(parsedEntity, path, node)

  parsedEntity
