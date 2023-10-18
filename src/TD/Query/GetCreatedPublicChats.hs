module TD.Query.GetCreatedPublicChats
  (GetCreatedPublicChats(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PublicChatType as PublicChatType

-- | Returns a list of public chats of the specified type, owned by the user. Returns 'TD.Data.Chats.Chats'
data GetCreatedPublicChats
  = GetCreatedPublicChats
    { _type :: Maybe PublicChatType.PublicChatType -- ^ Type of the public chats to return
    }
  deriving (Eq, Show)

instance I.ShortShow GetCreatedPublicChats where
  shortShow
    GetCreatedPublicChats
      { _type = _type_
      }
        = "GetCreatedPublicChats"
          ++ I.cc
          [ "_type" `I.p` _type_
          ]

instance AT.ToJSON GetCreatedPublicChats where
  toJSON
    GetCreatedPublicChats
      { _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "getCreatedPublicChats"
          , "type"  A..= _type_
          ]

