import {Channel} from 'actioncable'
import createChannel from './createChannel'
import User from '../models/User'
import Message from '../models/Message'

export interface ChatChannel extends Channel {
  postMessage(body: string): void;
}

function createChatChannel(groupId: number, received: (obj: { message: Message }) => void): ChatChannel {
  return createChannel<ChatChannel>({
    channel: 'ChatChannel',
    group_id: groupId
  }, {
    connected(): void {
    },
    disconnected(): void {
    },
    received(obj: any): void {
      (received as any)(obj)
    },
    postMessage(body: string) {
      this.perform('post_message', { body })
    }
  })
}

export default createChatChannel
