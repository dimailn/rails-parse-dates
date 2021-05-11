import {cloneDeep, set, get} from 'lodash'
import RecursiveIterator from 'recursive-iterator'

POSTFIXES = [
  'On'
  'At'
  'Till'
  'Date'
]

export default (entity, factory = (date) -> new Date(date)) ->
  parsedEntity = {}

  iterator = new RecursiveIterator(entity)

  for {node, path} from iterator
    if (POSTFIXES.some((p) -> ///\w+#{p}///.test(path[path.length - 1]))) && typeof node is 'string'
      node = factory(node)
    set(parsedEntity, path, node)

  parsedEntity
