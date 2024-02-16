module TD.Query.SetChatTitle
  (SetChatTitle(..)
  , defaultSetChatTitle
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified Data.Text as T

-- | Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info member right. Returns 'TD.Data.Ok.Ok'
data SetChatTitle
  = SetChatTitle
    { chat_id :: Maybe Int    -- ^ Chat identifier
    , title   :: Maybe T.Text -- ^ New title of the chat; 1-128 characters
    }
  deriving (Eq, Show)

instance I.ShortShow SetChatTitle where
  shortShow
    SetChatTitle
      { chat_id = chat_id_
      , title   = title_
      }
        = "SetChatTitle"
          ++ I.cc
          [ "chat_id" `I.p` chat_id_
          , "title"   `I.p` title_
          ]

instance AT.ToJSON SetChatTitle where
  toJSON
    SetChatTitle
      { chat_id = chat_id_
      , title   = title_
      }
        = A.object
          [ "@type"   A..= AT.String "setChatTitle"
          , "chat_id" A..= chat_id_
          , "title"   A..= title_
          ]

defaultSetChatTitle :: SetChatTitle
defaultSetChatTitle =
  SetChatTitle
    { chat_id = Nothing
    , title   = Nothing
    }

