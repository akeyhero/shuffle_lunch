<template>
  <div>
    <div v-if="hasNoMessage">
      まだチャットがありません
    </div>
    <ul v-else>
      <li v-for="message in messages">
        {{ message.body }}
        <span class="author">by {{ message.user.nickname }}</span>
      </li>
    </ul>
    <input v-model="newMessage" v-on:keypress.enter="postMessage" />
    <button v-on:click="postMessage" :disabled="! isReadyToPost">
      Post
    </button>
  </div>
</template>

<script lang="ts">
import Vue, {ComponentOptions} from 'vue'
import createChatChannel, {ChatChannel} from '../channels/createChatChannel'
import Message from '../models/Message'

interface ChatProps {
  groupId: number
  initialMessages: string
}
interface ChatData {
  messages: Message[]
  newMessage: string
  channel: ChatChannel
}
interface ChatMethods {
  postMessage(event: Event): void
}
interface ChatComputed {
  isReadyToPost: boolean
  hasNoMessage: boolean
}

export interface Chat extends Vue, ChatProps, ChatData, ChatMethods, ChatComputed {
}

export default {
  props: {
    groupId: Number,
    initialMessages: String
  },
  data: function () {
    return {
      newMessage: '',
      messages: JSON.parse(this.initialMessages || '[]'),
      channel: createChatChannel(this.groupId, ({ message }) => {
        this.messages.push(message)
        this.newMessage = ''
      })
    }
  },
  methods: {
    postMessage(event: Event) {
      if (this.isReadyToPost) {
        this.channel.postMessage(this.newMessage)
      }
    }
  },
  computed: {
    isReadyToPost() {
      return (this.newMessage as string).length > 0
    },
    hasNoMessage() {
      return (this.messages as Message[]).length === 0
    }
  }
} as ComponentOptions<Chat>
</script>

<style scoped>
.author {
  font-size: 80%;
}
</style>
