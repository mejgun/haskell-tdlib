module TD.Query.CheckCreatedPublicChatsLimit
  (CheckCreatedPublicChatsLimit(..)
  ) where

import qualified Data.Aeson as A
import qualified Data.Aeson.Types as AT
import qualified TD.Lib.Internal as I
import qualified TD.Data.PublicChatType as PublicChatType

-- | Checks whether the maximum number of owned public chats has been reached. Returns corresponding error if the limit was reached. The limit can be increased with Telegram Premium. Returns 'TD.Data.Ok.Ok'
data CheckCreatedPublicChatsLimit
  = CheckCreatedPublicChatsLimit
    { _type :: Maybe PublicChatType.PublicChatType -- ^ Type of the public chats, for which to check the limit
    }
  deriving (Eq, Show)

instance I.ShortShow CheckCreatedPublicChatsLimit where
  shortShow
    CheckCreatedPublicChatsLimit
      { _type = _type_
      }
        = "CheckCreatedPublicChatsLimit"
          ++ I.cc
          [ "_type" `I.p` _type_
          ]

instance AT.ToJSON CheckCreatedPublicChatsLimit where
  toJSON
    CheckCreatedPublicChatsLimit
      { _type = _type_
      }
        = A.object
          [ "@type" A..= AT.String "checkCreatedPublicChatsLimit"
          , "type"  A..= _type_
          ]

