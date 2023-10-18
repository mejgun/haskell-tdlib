module TD.Query.SetChatTheme
  (SetChatTheme(..)
  , defaultSetChatTheme
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the chat theme. Supported only in private and secret chats. Returns 'TD.Data.Ok.Ok'
data SetChatTheme
  = SetChatTheme
    { chat_id    :: Maybe Int    -- ^ Chat identifier
    , theme_name :: Maybe T.Text -- ^ Name of the new chat theme; pass an empty string to return the default theme
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatTheme where
  shortShow
    SetChatTheme
      { chat_id    = chat_id_
      , theme_name = theme_name_
      }
        = "SetChatTheme"
          ++ I.cc
          [ "chat_id"    `I.p` chat_id_
          , "theme_name" `I.p` theme_name_
          ]

instance AT.ToJSON SetChatTheme where
  toJSON
    SetChatTheme
      { chat_id    = chat_id_
      , theme_name = theme_name_
      }
        = A.object
          [ "@type"      A..= AT.String "setChatTheme"
          , "chat_id"    A..= chat_id_
          , "theme_name" A..= theme_name_
          ]

defaultSetChatTheme :: SetChatTheme
defaultSetChatTheme =
  SetChatTheme
    { chat_id    = Nothing
    , theme_name = Nothing
    }

