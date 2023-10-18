module TD.Query.GetTopChats
  (GetTopChats(..)
  , defaultGetTopChats
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.TopChatCategory as TopChatCategory

-- | Returns a list of frequently used chats. Returns 'TD.Data.Chats.Chats'
data GetTopChats
  = GetTopChats
    { category :: Maybe TopChatCategory.TopChatCategory -- ^ Category of chats to be returned
    , limit    :: Maybe Int                             -- ^ The maximum number of chats to be returned; up to 30
    }
  deriving (Eq, Show)

instance I.ShortShow GetTopChats where
  shortShow
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

defaultGetTopChats :: GetTopChats
defaultGetTopChats =
  GetTopChats
    { category = Nothing
    , limit    = Nothing
    }

