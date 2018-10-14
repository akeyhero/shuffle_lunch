import {Cable, Channel, ChannelNameWithParams, CreateMixin} from 'actioncable'
// @types/actioncable に定義がないので require でインポート
const ActionCable = require('actioncable')

let consumer: Cable | undefined

const createChannel = function (channel: string | ChannelNameWithParams, obj: CreateMixin): Channel {
  consumer = consumer || ActionCable.createConsumer() as Cable
  return consumer.subscriptions.create(channel, obj)
}

export default createChannel
