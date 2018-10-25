import {Cable, Channel, ChannelNameWithParams, CreateMixin} from 'actioncable'
// @types/actioncable に定義がないので require でインポート
const ActionCable = require('actioncable')

let consumer: Cable | undefined

function createChannel<T extends Channel>(channel: string | ChannelNameWithParams, obj: CreateMixin): T {
  consumer = consumer || ActionCable.createConsumer() as Cable
  return consumer.subscriptions.create(channel, obj) as T
}

export default createChannel
