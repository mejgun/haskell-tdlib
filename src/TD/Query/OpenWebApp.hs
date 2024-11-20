module TD.Query.OpenWebApp
  (OpenWebApp(..)
  , defaultOpenWebApp
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T
import qualified TD.Data.InputMessageReplyTo as InputMessageReplyTo
import qualified TD.Data.WebAppOpenParameters as WebAppOpenParameters

-- | Informs TDLib that a Web App is being opened from the attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button. For each bot, a confirmation alert about data sent to the bot must be shown once. Returns 'TD.Data.WebAppInfo.WebAppInfo'
data OpenWebApp
  = OpenWebApp
    { chat_id           :: Maybe Int                                       -- ^ Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats
    , bot_user_id       :: Maybe Int                                       -- ^ Identifier of the bot, providing the Web App
    , url               :: Maybe T.Text                                    -- ^ The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
    , message_thread_id :: Maybe Int                                       -- ^ If not 0, the message thread identifier in which the message will be sent
    , reply_to          :: Maybe InputMessageReplyTo.InputMessageReplyTo   -- ^ Information about the message or story to be replied in the message sent by the Web App; pass null if none
    , parameters        :: Maybe WebAppOpenParameters.WebAppOpenParameters -- ^ Parameters to use to open the Web App
    }
  deriving (Eq, Show)

instance I.ShortShow OpenWebApp where
  shortShow
    OpenWebApp
      { chat_id           = chat_id_
      , bot_user_id       = bot_user_id_
      , url               = url_
      , message_thread_id = message_thread_id_
      , reply_to          = reply_to_
      , parameters        = parameters_
      }
        = "OpenWebApp"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "bot_user_id"       `I.p` bot_user_id_
          , "url"               `I.p` url_
          , "message_thread_id" `I.p` message_thread_id_
          , "reply_to"          `I.p` reply_to_
          , "parameters"        `I.p` parameters_
          ]

instance AT.ToJSON OpenWebApp where
  toJSON
    OpenWebApp
      { chat_id           = chat_id_
      , bot_user_id       = bot_user_id_
      , url               = url_
      , message_thread_id = message_thread_id_
      , reply_to          = reply_to_
      , parameters        = parameters_
      }
        = A.object
          [ "@type"             A..= AT.String "openWebApp"
          , "chat_id"           A..= chat_id_
          , "bot_user_id"       A..= bot_user_id_
          , "url"               A..= url_
          , "message_thread_id" A..= message_thread_id_
          , "reply_to"          A..= reply_to_
          , "parameters"        A..= parameters_
          ]

defaultOpenWebApp :: OpenWebApp
defaultOpenWebApp =
  OpenWebApp
    { chat_id           = Nothing
    , bot_user_id       = Nothing
    , url               = Nothing
    , message_thread_id = Nothing
    , reply_to          = Nothing
    , parameters        = Nothing
    }

