module TD.Query.GetTopChats(GetTopChats(..)) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TopChatCategory as TopChatCategory

data GetTopChats -- ^ Returns a list of frequently used chats. Supported only if the chat info database is enabled
  = GetTopChats
    { category :: Maybe TopChatCategory.TopChatCategory -- ^ Category of chats to be returned
    , limit    :: Maybe Int                             -- ^ The maximum number of chats to be returned; up to 30
    }
  deriving (Eq)

instance Show GetTopChats where
  show
    GetTopChats
      { category = category_
      , limit    = limit_
      }
        = "GetTopChats"
          ++ I.cc
          [ "category" `I.p` category_
          , "limit"    `I.p` limit_
          ]

instance AT.ToJSON GetTopChats where
  toJSON
    GetTopChats
      { category = category_
      , limit    = limit_
      }
        = A.object
          [ "@type"    A..= AT.String "getTopChats"
          , "category" A..= category_
          , "limit"    A..= limit_
          ]
