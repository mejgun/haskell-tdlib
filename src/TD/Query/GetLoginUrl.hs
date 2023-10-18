module TD.Query.GetLoginUrl
  (GetLoginUrl(..)
  , defaultGetLoginUrl
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I

-- | Returns an HTTP URL which can be used to automatically authorize the user on a website after clicking an inline button of type inlineKeyboardButtonTypeLoginUrl. Use the method getLoginUrlInfo to find whether a prior user confirmation is needed. If an error is returned, then the button must be handled as an ordinary URL button. Returns 'TD.Data.HttpUrl.HttpUrl'
data GetLoginUrl
  = GetLoginUrl
    { chat_id            :: Maybe Int  -- ^ Chat identifier of the message with the button
    , message_id         :: Maybe Int  -- ^ Message identifier of the message with the button
    , button_id          :: Maybe Int  -- ^ Button identifier
    , allow_write_access :: Maybe Bool -- ^ Pass true to allow the bot to send messages to the current user
    }
  deriving (Eq, Show)

instance I.ShortShow GetLoginUrl where
  shortShow
    GetLoginUrl
      { chat_id            = chat_id_
      , message_id         = message_id_
      , button_id          = button_id_
      , allow_write_access = allow_write_access_
      }
        = "GetLoginUrl"
          ++ I.cc
          [ "chat_id"            `I.p` chat_id_
          , "message_id"         `I.p` message_id_
          , "button_id"          `I.p` button_id_
          , "allow_write_access" `I.p` allow_write_access_
          ]

instance AT.ToJSON GetLoginUrl where
  toJSON
    GetLoginUrl
      { chat_id            = chat_id_
      , message_id         = message_id_
      , button_id          = button_id_
      , allow_write_access = allow_write_access_
      }
        = A.object
          [ "@type"              A..= AT.String "getLoginUrl"
          , "chat_id"            A..= chat_id_
          , "message_id"         A..= message_id_
          , "button_id"          A..= button_id_
          , "allow_write_access" A..= allow_write_access_
          ]

defaultGetLoginUrl :: GetLoginUrl
defaultGetLoginUrl =
  GetLoginUrl
    { chat_id            = Nothing
    , message_id         = Nothing
    , button_id          = Nothing
    , allow_write_access = Nothing
    }

