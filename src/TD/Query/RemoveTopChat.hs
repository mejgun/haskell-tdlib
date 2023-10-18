module TD.Query.RemoveTopChat
  (RemoveTopChat(..)
  , defaultRemoveTopChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TopChatCategory as TopChatCategory

-- | Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled. Returns 'TD.Data.Ok.Ok'
data RemoveTopChat
  = RemoveTopChat
    { category :: Maybe TopChatCategory.TopChatCategory -- ^ Category of frequently used chats
    , chat_id  :: Maybe Int                             -- ^ Chat identifier
    }
  deriving (Eq, Show)

instance I.ShortShow RemoveTopChat where
  shortShow
    RemoveTopChat
      { category = category_
      , chat_id  = chat_id_
      }
        = "RemoveTopChat"
          ++ I.cc
          [ "category" `I.p` category_
          , "chat_id"  `I.p` chat_id_
          ]

instance AT.ToJSON RemoveTopChat where
  toJSON
    RemoveTopChat
      { category = category_
      , chat_id  = chat_id_
      }
        = A.object
          [ "@type"    A..= AT.String "removeTopChat"
          , "category" A..= category_
          , "chat_id"  A..= chat_id_
          ]

defaultRemoveTopChat :: RemoveTopChat
defaultRemoveTopChat =
  RemoveTopChat
    { category = Nothing
    , chat_id  = Nothing
    }

