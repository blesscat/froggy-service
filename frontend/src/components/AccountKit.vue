<template>
  <div>
    <slot>
      <p>You're not supposed to render this component empty.</p>
    </slot>
  </div>
</template>
<script>

/**
 * @see https://developers.facebook.com/docs/accountkit/webjs
 * to know how to use this
 */
export default {
  name: 'AccountKit',
  data () {
    return {
      appId: '',
      version: '',
      debug: false,
      state: 'somecrsf',
      fbAppEventsEnabled: true,
      loginType: 'PHONE',
      language: 'zh_TW',
      autoInit: true,
      diaplay: 'modal'
    }
  },
  props: {
    redirect: {
      type: String,
      default: ''
    }
  },
  mounted () {
    if (!window.AccountKit && this.autoInit) {
      console.log('initAccountKit')
      this.appId = process.env.VUE_APP_ACCOUNTKIT_APP_ID
      this.version = process.env.VUE_APP_ACCOUNTKIT_VERSION

      this.getCSRFToken().then(data => {
        console.log(data)
        this.state = data
        this.initAccountKit()
      })
    }
  },

  methods: {
    updateCSRFToken () {
      this.axios.delete('/api/types/1')
        .then(response => {
          console.log(response)
        })
        .catch(e => { console.log(e) })
    },
    getCSRFToken () {
      return this.axios.get('api/csrftoken/')
        .then(response => {
          return response.data['state']
        })
        .catch(e => { console.log(e) })
    },
    initAccountKit () {
      const tag = document.createElement('script')
      tag.setAttribute(
        'src',
        `https://sdk.accountkit.com/${this.language}/sdk.js`
      )
      tag.setAttribute('id', 'account-kit')
      tag.setAttribute('type', 'text/javascript')
      tag.onload = () => {
        /* eslint-disable camelcase */
        window.AccountKit_OnInteractive = this.onLoad.bind(this)
        /* eslint-enable camelcase */
      }
      document.head.appendChild(tag)
    },

    /**
     * Implementation of AccountKit_OnInteractive
     * Initializes the facebook authentication kit calling the init function.
     * @see https://developers.facebook.com/docs/accountkit/webjs/reference
     */
    onLoad () {
      const { appId, state, version, fbAppEventsEnabled, debug, diaplay } = this.$data
      console.log('account onLoad')

      window.AccountKit.init({
        appId,
        state,
        version,
        fbAppEventsEnabled,
        debug,
        diaplay
      })
    },
    /** console.log
     * @param {*} loginParams @see https://developers.facebook.com/docs/accountkit/webjs/reference
     */
    login (loginParams, callback) {
      window.AccountKit.login(this.loginType, loginParams, callback)
    }
  }
}
</script>
