module TD.Query.RemoveTopChat
  (RemoveTopChat(..)
  , defaultRemoveTopChat
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TopChatCategory as TopChatCategory

data RemoveTopChat -- ^ Removes a chat from the list of frequently used chats. Supported only if the chat info database is enabled
  = RemoveTopChat
    { category :: Maybe TopChatCategory.TopChatCategory -- ^ Category of frequently used chats
    , chat_id  :: Maybe Int                             -- ^ Chat identifier
    }
  deriving (Eq)

instance Show RemoveTopChat where
  show
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

