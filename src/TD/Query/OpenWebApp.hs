module TD.Query.OpenWebApp where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified Data.Text as T
import qualified Data.ByteString as BS
import qualified TD.Lib.Internal as I
import qualified TD.Data.ThemeParameters as ThemeParameters
import qualified TD.Data.MessageReplyTo as MessageReplyTo

data OpenWebApp -- ^ Informs TDLib that a Web App is being opened from attachment menu, a botMenuButton button, an internalLinkTypeAttachmentMenuBot link, or an inlineKeyboardButtonTypeWebApp button. For each bot, a confirmation alert about data sent to the bot must be shown once
  = OpenWebApp
    { chat_id           :: Maybe Int                             -- ^ Identifier of the chat in which the Web App is opened. The Web App can't be opened in secret chats
    , bot_user_id       :: Maybe Int                             -- ^ Identifier of the bot, providing the Web App
    , url               :: Maybe T.Text                          -- ^ The URL from an inlineKeyboardButtonTypeWebApp button, a botMenuButton button, or an internalLinkTypeAttachmentMenuBot link, or an empty string otherwise
    , theme             :: Maybe ThemeParameters.ThemeParameters -- ^ Preferred Web App theme; pass null to use the default theme
    , application_name  :: Maybe T.Text                          -- ^ Short name of the application; 0-64 English letters, digits, and underscores
    , message_thread_id :: Maybe Int                             -- ^ If not 0, a message thread identifier in which the message will be sent
    , reply_to          :: Maybe MessageReplyTo.MessageReplyTo   -- ^ Identifier of the replied message or story for the message sent by the Web App; pass null if none
    }
  deriving (Eq)

instance Show OpenWebApp where
  show
    OpenWebApp
      { chat_id           = chat_id_
      , bot_user_id       = bot_user_id_
      , url               = url_
      , theme             = theme_
      , application_name  = application_name_
      , message_thread_id = message_thread_id_
      , reply_to          = reply_to_
      }
        = "OpenWebApp"
          ++ I.cc
          [ "chat_id"           `I.p` chat_id_
          , "bot_user_id"       `I.p` bot_user_id_
          , "url"               `I.p` url_
          , "theme"             `I.p` theme_
          , "application_name"  `I.p` application_name_
          , "message_thread_id" `I.p` message_thread_id_
          , "reply_to"          `I.p` reply_to_
          ]

instance AT.ToJSON OpenWebApp where
  toJSON
    OpenWebApp
      { chat_id           = chat_id_
      , bot_user_id       = bot_user_id_
      , url               = url_
      , theme             = theme_
      , application_name  = application_name_
      , message_thread_id = message_thread_id_
      , reply_to          = reply_to_
      }
        = A.object
          [ "@type"             A..= AT.String "openWebApp"
          , "chat_id"           A..= chat_id_
          , "bot_user_id"       A..= bot_user_id_
          , "url"               A..= url_
          , "theme"             A..= theme_
          , "application_name"  A..= application_name_
          , "message_thread_id" A..= message_thread_id_
          , "reply_to"          A..= reply_to_
          ]
