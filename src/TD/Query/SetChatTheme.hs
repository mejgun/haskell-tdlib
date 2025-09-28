module TD.Query.SetChatTheme
  (SetChatTheme(..)
  , defaultSetChatTheme
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.InputChatTheme as InputChatTheme

-- | Changes the chat theme. Supported only in private and secret chats. Returns 'TD.Data.Ok.Ok'
data SetChatTheme
  = SetChatTheme
    { chat_id :: Maybe Int                           -- ^ Chat identifier
    , theme   :: Maybe InputChatTheme.InputChatTheme -- ^ New chat theme; pass null to return the default theme
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatTheme where
  shortShow
    SetChatTheme
      { chat_id = chat_id_
      , theme   = theme_
      }
        = "SetChatTheme"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "theme"   `I.p` theme_
          ]

instance AT.ToJSON SetChatTheme where
  toJSON
    SetChatTheme
      { chat_id = chat_id_
      , theme   = theme_
      }
        = A.object
          [ "@type"   A..= AT.String "setChatTheme"
          , "chat_id" A..= chat_id_
          , "theme"   A..= theme_
          ]

defaultSetChatTheme :: SetChatTheme
defaultSetChatTheme =
  SetChatTheme
    { chat_id = Nothing
    , theme   = Nothing
    }

